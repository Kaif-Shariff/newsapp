import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/presentation/widgets/home/custom_list_tile.dart';
import '../../../core/apptheme/colors.dart';
import '../../../core/error/error_widget.dart';
import '../../../state/category/category_bloc.dart';
import '../../../state/category/category_state.dart';
import '../../../utils/dateFormatter.dart';
import '../../screens/article_screen.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.blue),
            ),
          );
        }
        if (state is CategoryError) {
          return state.statusCode == 429
              ? MyErrorWidget(width: width, height: height, message: "Api Exhausted")
              : SliverToBoxAdapter(
                  child: Center(child: Text("Something went wrong")),
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
                      child: CircularProgressIndicator(color: AppColors.blue),
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
    );
  }
}
