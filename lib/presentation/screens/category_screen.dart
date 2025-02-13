import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/apptheme/colors.dart';
import 'package:newsapp/state/category/category_event.dart';
import '../../core/error/error_widget.dart';
import '../../state/category/category_bloc.dart';
import '../../state/category/category_state.dart';
import '../../utils/dateFormatter.dart';
import '../widgets/home/custom_list_tile.dart';
import 'article_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String topicName;

  const CategoryScreen({super.key, required this.topicName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    _fetchCategoryNews();
  }

  void _fetchCategoryNews() {
    context.read<CategoryBloc>().add(ResetCategoryEvent());
    context.read<CategoryBloc>().add(FetchCategoryEvent(widget.topicName, 20));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: Text(widget.topicName)),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return SliverToBoxAdapter(
                  child: Center(
                      child: CircularProgressIndicator(
                    color: AppColors.blue,
                  )),
                );
              }
              if (state is CategoryError) {
                return state.statusCode == 429
                    ? MyErrorWidget(width: width, height: height, message: "Api Exhausted")
                    : SliverToBoxAdapter(
                        child: Center(
                          child: Text("Something went wrong"),
                        ),
                      );
              }
              if (state is CategoryLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < state.articles.length) {
                        final article = state.articles[index];
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
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.blue,
                            ),
                          ),
                        );
                      }
                    },
                    childCount: state.articles.length + (state.hasReachedMax ? 0 : 1),
                  ),
                );
              }
              return SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }
}
