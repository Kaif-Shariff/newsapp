import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/presentation/widgets/home/customTab.dart';
import 'package:newsapp/utils/constants.dart';

class TabSlider extends StatelessWidget {
  const TabSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(child: CustomTab(statusTxt: categories[index]));
        },
      ),
    );
  }
}
