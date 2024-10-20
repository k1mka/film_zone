import 'package:film_zone/setup_service_locator.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_bloc.dart';
import 'package:film_zone/ui/film_catalog_screen/film_catalog_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmCatalogScreen extends StatelessWidget {
  const FilmCatalogScreen({super.key});

  static const routeName = '/FilmCatalogScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmCatalogBloc(getRepo),
      child: const FilmCatalogLayout(),
    );
  }
}
