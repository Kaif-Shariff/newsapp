import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
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
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height / 3.5),
        child: CarouselView.weighted(
          controller: _carouselController,
          itemSnapping: true,
          flexWeights: [1, 7, 1],
          onTap: (int index) {
            final article = TopNews.values[index];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleScreen(
                  heading: article.headline,
                  desc: article.description,
                  content: article.description,
                  date: article.date,
                  authorName: article.authorName,
                  publisher: article.publisher,
                  imgUrl: article.imageUrl,
                ),
              ),
            );
          },
          children: TopNews.values.map(
            (TopNews topNews) {
              return Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRect(
                    child: SizedBox.expand(
                      child: Image.network(
                        topNews.imageUrl,
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
                          topNews.headline,
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
}
