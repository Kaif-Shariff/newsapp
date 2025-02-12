import 'package:flutter/material.dart';
import 'package:newsapp/core/apptheme/colors.dart';

import '../../../utils/getTheme.dart';

class CustomTab extends StatelessWidget {
  final String statusTxt;

  const CustomTab({
    super.key,
    required this.statusTxt,
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
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Center(
        child: Text(
          statusTxt,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: (isLightTheme(context) ? AppColors.lightTextColor : AppColors.darkTextColor),
          ),
        ),
      ),
    );
  }
}
