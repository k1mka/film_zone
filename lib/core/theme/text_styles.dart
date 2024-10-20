import 'package:film_zone/core/theme/palette.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get filmTitleStyle => const TextStyle(
        fontSize: 18,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get posterTitleStyle => const TextStyle(
        fontSize: 14,
        color: Palette.white,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get emptyTextStyle => const TextStyle(
        color: Palette.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get initialStyle => const TextStyle(
        fontSize: 16,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get hintStyle => const TextStyle(
        fontSize: 20,
        color: Palette.greyDark,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get inputTextStyle => const TextStyle(
        fontSize: 16,
        color: Palette.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get linkTextStyle => const TextStyle(
        fontSize: 16,
        color: Palette.lightBlue,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get descriptionTextStyle => const TextStyle(
        fontSize: 16,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get filmCatalogStyle => const TextStyle(
        fontSize: 24,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w600,
      );
}
