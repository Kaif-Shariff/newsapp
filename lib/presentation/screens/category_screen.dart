import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/state/category/category_event.dart';
import '../../core/apptheme/colors.dart';
import '../../state/category/category_bloc.dart';
import '../../state/category/category_state.dart';
import '../../utils/constants.dart';
import '../../utils/dateFormatter.dart';
import '../../utils/getTheme.dart';
import '../widgets/home/custom_list_tile.dart';
import 'article_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String topicName;

  const CategoryScreen({super.key, required this.topicName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isFetched = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryBloc>().add(FetchCategory(widget.topicName));
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!_isFetched) {
        _isFetched = true;
        _currentPage++;
        context.read<CategoryBloc>().add(FetchCategory(widget.topicName, page: _currentPage));
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicName),
      ),
      body: BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoaded) {
            _isFetched = false;
          }
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  );
                } else if (state is CategoryError) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300,
                      child: Center(child: Text("Error fetching news")),
                    ),
                  );
                } else if (state is CategoryLoaded) {
                  final articles = state.articles;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < articles.length) {
                          final article = articles[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleScreen(
                                    heading: article.title ?? "Unknown",
                                    desc: article.description ?? "Unknown",
                                    content: article.content ?? "Unknown",
                                    date: dateFormatter(article.publishedAt!),
                                    authorName: article.author ?? "Unknown",
                                    publisher: article.source?.name ?? "Unknown",
                                    imgUrl: article.urlToImage ?? "Unknown",
                                  ),
                                ),
                              );
                            },
                            child: CustomListTile(article: article),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.blue,
                              ),
                            ),
                          );
                        }
                      },
                      childCount: articles.length + (state.hasReachedMax ? 0 : 1),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text("Error getting category news"),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
