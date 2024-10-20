import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Padding(
          padding: Tokens.padding20,
          child: LinearProgressIndicator(),
        ),
      );
}
