import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 29.0, fontWeight: FontWeight.bold, color: TColors.dark),
    headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: TColors.dark),
    headlineSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: TColors.dark),

    titleLarge: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: TColors.dark),
    titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: TColors.dark),
    titleSmall: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: TColors.dark),

    bodyLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: TColors.dark),
    bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: TColors.dark),
    bodySmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: TColors.dark.withAlpha(128)),

    labelLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.dark),
    labelMedium: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: TColors.dark.withAlpha(128)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 29.0, fontWeight: FontWeight.bold, color: TColors.light),
    headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: TColors.light),
    headlineSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: TColors.light),

    titleLarge: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: TColors.light),
    titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: TColors.light),
    titleSmall: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: TColors.light),

    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.light),
    bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal, color: TColors.light),
    bodySmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: TColors.light.withAlpha(128)),

    labelLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.light),
    labelMedium: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: TColors.light.withAlpha(128)),
  );
}
