import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/gen/assets.gen.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  static const _size = 220.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.images.png.emptyState.path, width: _size, height: _size),
        Padding(
          padding: Tokens.paddingH32,
          child: Text(
            textAlign: TextAlign.center,
            context.s.data_not_found_please_check_your_request_or_try_searching_for_something_else,
            style: TextStyles.emptyTextStyle,
          ),
        )
      ],
    );
  }
}
