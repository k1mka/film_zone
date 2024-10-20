import 'dart:convert';
import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/film_Info_screen/film_Info_screen.dart';
import 'package:film_zone/ui/film_catalog_screen/film_catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routerKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  navigatorKey: routerKey,
  initialLocation: FilmCatalogScreen.routeName,
  routes: [
    GoRoute(
      name: FilmCatalogScreen.routeName,
      path: FilmCatalogScreen.routeName,
      builder: (__, _) => const FilmCatalogScreen(),
      routes: [
        GoRoute(
          name: FilmInfoScreen.routeName,
          path: '${FilmInfoScreen.routeName}/:${FilmInfoScreen.param}',
          builder: (__, state) {
            final filmJson = state.pathParameters[FilmInfoScreen.param]!;
            final filmModel = FilmModel.fromJson(jsonDecode(filmJson));
            return FilmInfoScreen(filmModel: filmModel);
          },
        ),
      ],
    ),
  ],
);
