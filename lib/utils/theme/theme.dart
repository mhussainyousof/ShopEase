import 'package:ecommerce_app/utils/theme/custome_theme/appbar_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/bottom_sheet_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/checkbox_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/chip_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/elevated_button_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/outlined_button_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/text_field_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_theme/text_theme.dart';
import 'package:flutter/material.dart';

class EAppTheme {
  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme:ETextTheme.lightTextTheme,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheet,
    checkboxTheme: ECheckBoxTheme.lightCheckboxTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EOutLineButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
    chipTheme: EChipTheme.lightChipTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme:ETextTheme.darkTextTheme,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheet,
    checkboxTheme: ECheckBoxTheme.darkCheckboxTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EOutLineButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
    chipTheme: EChipTheme.darkChipTheme,
  );
}
