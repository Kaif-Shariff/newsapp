import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/apptheme/colors.dart';
import '../../state/category/category_bloc.dart';
import '../../state/category/category_state.dart';
import '../../utils/constants.dart';
import '../../utils/dateFormatter.dart';
import '../../utils/getTheme.dart';
import 'article_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String topicName;

  const CategoryScreen({super.key, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topicName),
      ),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppColors.blue,
                    )),
                  ),
                );
              } else if (state is CategoryError) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    child: Center(child: Text("Error fetching news")),
                  ),
                );
              } else if (state is CategoryLoaded) {
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  article.urlToImage ?? sampleImage,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: SizedBox(height: 30),
                                      ),
                                      TextSpan(
                                        text: "${article.title ?? "Unknown"}\n",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: isLightTheme(context) ? AppColors.lightTextColor2 : AppColors.lightTextColor,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: SizedBox(height: 45),
                                      ),
                                      TextSpan(
                                        text: "${dateFormatter(article.publishedAt!)}   •   ${article.source?.name ?? "Unknown"}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.lightTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
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
          )
        ],
      ),
    );
  }
}
