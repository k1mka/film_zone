import 'package:film_zone/core/theme/palette.dart';
import 'package:flutter/material.dart';

extension CustomTextStyleExtension on TextStyle {
  TextStyle c({Color? color}) {
    return TextStyle(
      color: color ?? this.color,
    );
  }
}

abstract class TextStyles {
  static TextStyle get filmTitleStyle => const TextStyle(
        fontSize: 18,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get filmCatalogStyle => const TextStyle(
    fontSize: 22,
    color: Palette.blurTextColor,
    fontWeight: FontWeight.w400,
  );
}
