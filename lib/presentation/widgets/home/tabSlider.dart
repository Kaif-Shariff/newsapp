import 'package:flutter/material.dart';
import 'package:newsapp/presentation/widgets/home/customTab.dart';
import 'package:newsapp/utils/constants.dart';
import '../../../utils/all_category_bottom_sheet.dart';

class TabSlider extends StatelessWidget {
  const TabSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == categories.length - 1) {
                allcategory(context);
              }
            },
            child: CustomTab(
              statusTxt: categories[index],
            ),
          );
        },
      ),
    );
  }
}
