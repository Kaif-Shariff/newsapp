import 'package:flutter/material.dart';
import 'package:newsapp/core/apptheme/colors.dart';
import 'package:newsapp/presentation/screens/category_screen.dart';
import 'package:newsapp/utils/getTheme.dart';

import '../../screens/article_screen.dart';

Future<dynamic> allCategory(BuildContext context) {
  final List<String> allCategoriesList = [
    "Entertainment",
    "Health",
    "Movies",
    "Trending",
    "Top News",
    "Beauty",
  ];

  final bool isLight = isLightTheme(context);
  final Color backgroundColor = isLight ? AppColors.darkBackground : AppColors.lightBackground;
  final Color containerColor = isLight ? Colors.white : AppColors.darkBackground;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: GridView.builder(
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: allCategoriesList.length,
              itemBuilder: (context, index) {
                final String category = allCategoriesList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(topicName: category.toLowerCase()),
                      ),
                    );
                  },
                  child: _CategoryTile(
                    category: category,
                    backgroundColor: isLight ? AppColors.secondBackground : AppColors.darkTextSecondary,
                  ),
                );
              },
            ),
          );
        },
      );
    },
  );
}

class _CategoryTile extends StatelessWidget {
  final String category;
  final Color backgroundColor;

  const _CategoryTile({
    required this.category,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: (isLightTheme(context) ? AppColors.lightBorder : AppColors.darkBorder),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: (isLightTheme(context) ? AppColors.lightTextColor : AppColors.darkTextColor),
          ),
        ),
      ),
    );
  }
}
