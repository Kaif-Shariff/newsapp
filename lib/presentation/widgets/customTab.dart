import 'package:flutter/material.dart';
import 'package:newsapp/core/apptheme/colors.dart';

class CustomTab extends StatefulWidget {
  final int index;
  final String statusTxt;
  final int size;

  const CustomTab({
    super.key,
    required this.index,
    required this.statusTxt,
    required this.size,
  });

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                (isLightTheme ? AppColors.lightBorder : AppColors.darkBorder),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          widget.statusTxt,
          style: TextStyle(
            color: (isLightTheme
                ? AppColors.lightTextColor
                : AppColors.darkTextColor),
          ),
        ),
      ),
    );
  }
}
