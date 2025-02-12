import 'package:flutter/material.dart';
import 'package:newsapp/utils/string_shortner.dart';
import '../../../utils/constants.dart';

class CarouselContainer extends StatelessWidget {
  final TopNews topNews;

  const CarouselContainer({
    super.key,
    required this.topNews,
  });

  @override
  Widget build(BuildContext context) {
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
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black.withValues(alpha: 0.6),
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
                stringShortner(text: topNews.headline, characterCount: 38),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Text(
                stringShortner(text: topNews.summary, characterCount: 110),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
