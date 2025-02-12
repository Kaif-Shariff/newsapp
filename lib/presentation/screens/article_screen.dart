import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ArticleScreen extends StatelessWidget {
  final String heading;
  final String desc;
  final String content;
  final String date;
  final String authorName;
  final String publisher;
  final String imgUrl;

  const ArticleScreen({
    super.key,
    required this.heading,
    required this.desc,
    required this.content,
    required this.date,
    required this.authorName,
    required this.publisher,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12), // Rounded bottom corners
                bottomRight: Radius.circular(12),
              ),
              child: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(20),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
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
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$date   •   $publisher",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing
                  Text(
                    heading,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(desc),
                  SizedBox(height: 10),
                  Text(content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
