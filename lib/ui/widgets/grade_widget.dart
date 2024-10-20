import 'package:film_zone/gen/assets.gen.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.grade,
  });

  final double grade;

  static const int maxStars = 10;
  static const double maxGrade = 10.0;
  static const double starIconSize = 32.0;

  int get filledStars => (grade / maxGrade * maxStars).round();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        maxStars,
        (index) {
          final isFilled = index < filledStars;
          return SvgPicture.asset(
            isFilled ? Assets.icons.svg.starFilled : Assets.icons.svg.starUnfilled,
            width: starIconSize,
            height: starIconSize,
          );
        },
      ),
    );
  }
}
