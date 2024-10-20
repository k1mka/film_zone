import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: Tokens.padding20,
        child: Text(
          context.s.to_start_searching,
          style: TextStyles.initialStyle,
        ),
      );
}
