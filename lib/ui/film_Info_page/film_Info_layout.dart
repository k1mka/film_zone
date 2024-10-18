import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/gen/assets.gen.dart';
import 'package:film_zone/ui/film_catalog_screen/film_catalog_screen.dart';
import 'package:flutter/material.dart';

class FilmInfoLayout extends StatelessWidget {
  const FilmInfoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.png.cat.path),
            GestureDetector(
              onTap: () => context.r.push(FilmCatalogScreen.routeName),
              child: Text(
                context.s.film_info_screen,
                style: TextStyles.logoStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
