import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/screens/article_screen.dart';
import 'package:newsapp/presentation/widgets/home/custom_list_tile.dart';
import '../../../core/apptheme/colors.dart';
import '../../../state/article/article_bloc.dart';
import '../../../state/article/article_event.dart';
import '../../../state/article/article_state.dart';
import '../../../utils/constants.dart';
import '../../../utils/dateFormatter.dart';
import '../../../utils/getTheme.dart';

class NewsList extends StatefulWidget {
  final String topic;

  const NewsList({
    super.key,
    required this.topic,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleBloc>().add(FetchCategory(widget.topic));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                  child: CircularProgressIndicator(
                color: AppColors.blue,
              )),
            ),
          );
        } else if (state is ArticleError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              child: Center(child: Text("Error fetching news")),
            ),
          );
        } else if (state is ArticleLoaded) {
          final articles = state.articles;

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) {
                final article = articles[index];

                return InkWell(
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
              },
            ),
          );
        }
        return SliverToBoxAdapter(
          child: SizedBox(
            child: Center(child: Text("Something went horribly wrong")),
          ),
        );
      },
    );
  }
}
