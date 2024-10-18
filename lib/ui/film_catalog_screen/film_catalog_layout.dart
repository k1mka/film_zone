import 'package:film_zone/core/templates/context_extensions.dart';
import 'package:film_zone/core/theme/text_styles.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_bloc.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmCatalogLayout extends StatelessWidget {
  const FilmCatalogLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.read<FilmCatalogBloc>().add(InitialCatalogEvent()),
              child: Text(
                context.s.film_catalog_screen,
                style: TextStyles.logoStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
