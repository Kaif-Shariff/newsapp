import 'package:flutter/material.dart';
import 'package:newsapp/core/apptheme/colors.dart';
import 'package:newsapp/presentation/widgets/customTab.dart';
import 'package:newsapp/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  Text(
                    "News App",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 400),
              child: CarouselView(
                itemExtent: 280,
                shrinkExtent: 100,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                // itemSnapping: true,
                children: List.generate(
                  images.length,
                  (index) => Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight / 15,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      CustomTab(
                        index: 0,
                        statusTxt: "New",
                        size: 3,
                      ),
                      CustomTab(
                        index: 1,
                        statusTxt: "Confirmed",
                        size: 1,
                      ),
                      CustomTab(
                        index: 2,
                        statusTxt: "Completed",
                        size: 1,
                      ),
                      CustomTab(
                        index: 3,
                        statusTxt: "Picked Up",
                        size: 2,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
