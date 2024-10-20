import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/palette.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  static const _iconSize = 32.0;
  static const _padding = EdgeInsets.only(left: 14, top: 14);

  @override
  Widget build(BuildContext context) => Padding(
      padding: _padding,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: _iconSize,
          color: Palette.fillColor,
        ),
        onPressed: context.r.pop,
      ),
    );
}
