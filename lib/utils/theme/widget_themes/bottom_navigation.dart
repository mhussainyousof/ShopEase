 import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class TNavigationBarTheme{
  TNavigationBarTheme._();



  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    height: 60,
    elevation: 0,
    backgroundColor: TColors.white,
    indicatorColor: TColors.primary.withAlpha(26),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (states) => TextStyle(
        fontSize: TSizes.fontSizeSm - 4,
        color: states.contains(WidgetState.selected)
            ? TColors.primary
            : TColors.darkerGrey,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (states) => IconThemeData(
        color: states.contains(WidgetState.selected)
            ? TColors.primary
            : TColors.darkerGrey,
        size: TSizes.iconMd - 5,
      ),
    ),


  );
  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    elevation: 0,
    height: 80,
    backgroundColor: TColors.dark,
    indicatorColor: TColors.white.withAlpha(51),

    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (states) => TextStyle(
        fontSize: TSizes.fontSizeSm - 4,
        color: states.contains(WidgetState.selected)
            ? TColors.primary
            : TColors.lightGrey,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (states) => IconThemeData(
        color: states.contains(WidgetState.selected)
            ? TColors.primary
            : TColors.lightGrey,
        size: TSizes.iconMd - 5,
      ),
    ),
  );
}
