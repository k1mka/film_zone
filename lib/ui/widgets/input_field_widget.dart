import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  static const _filled = true;
  static const _prefixIcon = Icon(Icons.search, color: Palette.greyDark, size: 26);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Tokens.paddingH16,
      child: TextField(
        cursorColor: Palette.white,
        style: TextStyles.inputTextStyle,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: _prefixIcon,
          contentPadding: Tokens.padding12,
          hintStyle: TextStyles.hintStyle,
          hintText: context.s.search,
          border: const OutlineInputBorder(
            borderRadius: Tokens.borderRadius8,
            borderSide: BorderSide.none,
          ),
          filled: _filled,
          fillColor: Palette.fillColor,
        ),
      ),
    );
  }
}
