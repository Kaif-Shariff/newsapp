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
            expandedHeight: 400,
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "February 12, 2025   •   Wired",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    sampleHeading,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(sampleDescription),
                  Text("President Trump has surrounded himself with crypto enthusiasts. Thats no coincidence. In 2024 the cryptocurrency industry spent millions backing friendly congressional candidates, many of whom were R… [+817 chars]"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
