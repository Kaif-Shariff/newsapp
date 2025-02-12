import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.green,
    fontFamily: 'PoppinsRegular',
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 9, color: AppColors.lightTextColor2),
      headlineMedium: TextStyle(fontSize: 15, color: AppColors.lightTextColor2),
      headlineLarge: TextStyle(fontSize: 25, color: AppColors.lightTextColor2),
      bodySmall: TextStyle(fontSize: 9, color: AppColors.lightTextColor2),
      bodyMedium: TextStyle(fontSize: 15, color: AppColors.lightTextColor2),
      bodyLarge: TextStyle(fontSize: 25, color: AppColors.lightTextColor2),
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      surfaceTintColor: AppColors.lightBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.lightTextColor2,
        fontSize: 22,
        fontFamily: 'PoppinsBold',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        enableFeedback: true,
        textStyle: const TextStyle(
          fontFamily: 'PoppinsBold',
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      hintStyle: const TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      prefixStyle: const TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: AppColors.red,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.lightBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.lightBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.lightBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.lightBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.green,
      selectionColor: AppColors.green.withOpacity(0.5),
      selectionHandleColor: AppColors.green,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.unSelectedIcon,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'PoppinsMedium',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'PoppinsMedium',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.green,
    fontFamily: 'PoppinsRegular',
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 9, color: AppColors.darkTextColor),
      headlineMedium: TextStyle(fontSize: 15, color: AppColors.darkTextColor),
      headlineLarge: TextStyle(fontSize: 25, color: AppColors.darkTextColor),
      bodySmall: TextStyle(fontSize: 9, color: AppColors.darkTextColor),
      bodyMedium: TextStyle(fontSize: 15, color: AppColors.darkTextColor),
      bodyLarge: TextStyle(fontSize: 25, color: AppColors.darkTextColor),
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: AppColors.darkBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontFamily: 'PoppinsBold',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        enableFeedback: true,
        textStyle: const TextStyle(
          fontFamily: 'PoppinsBold',
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      hintStyle: const TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      prefixStyle: const TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: AppColors.red,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.darkBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.darkBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.darkBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.darkBorder,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.green,
      selectionColor: AppColors.green.withOpacity(0.5),
      selectionHandleColor: AppColors.green,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.unSelectedIcon,
      enableFeedback: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'PoppinsMedium',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'PoppinsMedium',
      ),
    ),
  );
}
