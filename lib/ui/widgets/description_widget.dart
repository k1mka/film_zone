import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DescriptionWidget extends HookWidget {
  const DescriptionWidget({super.key, required this.filmModel});

  final FilmModel filmModel;

  static const _minLength = 0;
  static const _maxLength = 240;
  static const _spacer = TextSpan(text: ' ');

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    final overview = filmModel.overview;

    final bool isTextLong = overview.length > _maxLength;

    final String displayedText = isTextLong && !isExpanded.value
        ? '${overview.substring(_minLength, _maxLength)}...'
        : overview;

    return Padding(
      padding: Tokens.paddingH16,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: displayedText,
              style: TextStyles.descriptionTextStyle,
            ),
            _spacer,
            if (isTextLong)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => isExpanded.value = !isExpanded.value,
                  child: Text(
                    isExpanded.value ? context.s.show_less : context.s.show_more,
                    style: TextStyles.linkTextStyle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
