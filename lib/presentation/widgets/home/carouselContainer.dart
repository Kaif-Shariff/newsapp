import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/state/article_bloc.dart';
import 'package:newsapp/state/article_state.dart';
import 'package:newsapp/utils/constants.dart';

import '../../../state/article_event.dart';
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
      context.read<ArticleBloc>().add(FetchTopHeadlines());
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: height / 3.5,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is ArticleError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: height / 3.5,
              child: Center(child: Text("Error fetching news")),
            ),
          );
        } else if (state is ArticleLoaded) {
          final articles = state.articles;
          return SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height / 3.5),
              child: CarouselView.weighted(
                controller: _carouselController,
                itemSnapping: true,
                flexWeights: [1, 7, 1],
                onTap: (int index) {
                  final article = articles[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(
                        heading: article.title ?? "Unknown",
                        desc: article.description ?? "Unknown",
                        content: article.content ?? "Unknown",
                        date: article.publishedAt ?? "Unknown",
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
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
