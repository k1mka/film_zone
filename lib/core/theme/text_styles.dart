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
  static TextStyle get logoStyle => const TextStyle(
        fontSize: 32,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w900,
      );
}
