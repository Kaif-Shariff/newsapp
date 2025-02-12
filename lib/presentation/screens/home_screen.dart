import 'package:flutter/material.dart';
import 'package:newsapp/presentation/widgets/home/customTab.dart';
import 'package:newsapp/utils/constants.dart';

import '../widgets/home/carouselContainer.dart';
import '../widgets/home/tabSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController(initialItem: 1);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        spacing: 20,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height / 1.8),
            child: CarouselView.weighted(
              controller: _carouselController,
              itemSnapping: true,
              flexWeights: [1, 7, 1],
              children: TopNews.values.map(
                (TopNews topnews) {
                  return CarouselContainer(topNews: topnews);
                },
              ).toList(),
            ),
          ),
          TabSlider(),
        ],
      ),
    );
  }
}
