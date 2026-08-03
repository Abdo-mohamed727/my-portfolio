import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0A0E14);
  static const Color surface = Color(0xFF141922);
  static const Color surfaceLight = Color(0xFF1C232F);
  static const Color primary = Color(0xFF5B8DEF);
  static const Color primaryLight = Color(0xFF8AB4FF);
  static const Color accent = Color(0xFF4ADE80);
  static const Color textPrimary = Color(0xFFF5F7FA);
  static const Color textSecondary = Color(0xFF9AA5B1);
  static const Color border = Color(0xFF262E3B);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 56,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          height: 1.5,
        ),
      ),
    );
  }
}

/// Simple responsive breakpoints helper used across the app.
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double horizontalPadding(BuildContext context) {
    if (isMobile(context)) return 20;
    if (isTablet(context)) return 48;
    return 100;
  }
}
