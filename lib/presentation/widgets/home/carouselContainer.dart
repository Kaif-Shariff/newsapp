import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/apptheme/colors.dart';
import 'package:newsapp/state/article/article_bloc.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/utils/dateFormatter.dart';
import '../../../core/error/error_widget.dart';
import '../../../state/article/article_event.dart';
import '../../../state/article/article_state.dart';
import '../../screens/article_screen.dart';

class CarouselContainer extends StatefulWidget {
  const CarouselContainer({
    super.key,
  });

  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  final CarouselController _carouselController = CarouselController(initialItem: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleBloc>().add(FetchTopHeadlines(5));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: height / 3.5,
              child: Center(
                  child: CircularProgressIndicator(
                color: AppColors.blue,
              )),
            ),
          );
        } else if (state is ArticleError) {
          return state.statusCode == 429
              ? MyErrorWidget(width: width, height: height, message: "Api Exhausted")
              : SliverToBoxAdapter(
                  child: Center(
                    child: Text("Something went wrong"),
                  ),
                );
        } else if (state is ArticleLoaded) {
          final articles = state.articles;
          return SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height / 3.2),
              child: CarouselView.weighted(
                controller: _carouselController,
                itemSnapping: true,
                flexWeights: [1, 14, 1],
                onTap: (int index) {
                  final article = articles[index];
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
                children: articles.map(
                  (article) {
                    return Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        ClipRect(
                          child: SizedBox.expand(
                            child: Image.network(
                              article.urlToImage ?? sampleImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.9),
                                  Colors.black.withValues(alpha: 0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                article.title ?? "Unknown",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: SizedBox(
            height: height / 3.5,
            child: Center(child: Text("Something went horribly wrong")),
          ),
        );
      },
    );
  }
}
