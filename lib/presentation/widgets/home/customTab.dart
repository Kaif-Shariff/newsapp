import 'package:flutter/material.dart';
import 'package:newsapp/core/apptheme/colors.dart';

class CustomTab extends StatelessWidget {
  final String statusTxt;

  const CustomTab({
    super.key,
    required this.statusTxt,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: (isLightTheme ? AppColors.lightBorder : AppColors.darkBorder),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          statusTxt,
          style: TextStyle(
            color: (isLightTheme ? AppColors.lightTextColor : AppColors.darkTextColor),
          ),
        ),
      ),
    );
  }
}
