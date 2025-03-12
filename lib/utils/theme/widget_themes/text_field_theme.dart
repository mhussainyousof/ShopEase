import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  // 🌞 Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

    // filled: true,
    // fillColor: TColors.lightGrey,

    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,

    labelStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.black,
    ),

    hintStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.darkGrey,
    ),

    floatingLabelStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.primary,
    ),

    errorStyle: const TextStyle(
      fontSize: 12,
      color: TColors.warning,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.grey, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.grey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.warning, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.warning, width: 1.5),
    ),
  );

  // 🌚 Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

    filled: true,
    fillColor: TColors.darkerGrey,

    prefixIconColor: TColors.white,
    suffixIconColor: TColors.white,

    labelStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.white,
    ),

    hintStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.lightGrey,
    ),

    floatingLabelStyle: const TextStyle(
      fontSize: TSizes.fontSizeSm,
      color: TColors.lightGrey,
    ),

    errorStyle: const TextStyle(
      fontSize: 12,
      color: TColors.warning,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.darkGrey, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.darkGrey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.grey, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.warning, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(color: TColors.warning, width: 1.5),
    ),
  );
}
