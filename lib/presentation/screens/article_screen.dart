import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(20),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    sampleImage,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return ListTile(
                  title: Text(
                    sampleDescription,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    sampleDescription,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
