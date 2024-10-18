import 'package:film_zone/core/logger/composite_logger_holder.dart';
import 'package:film_zone/core/router/app_router_holder.dart';
import 'package:film_zone/core/router/router.dart';
import 'package:film_zone/core/theme/palette.dart';
import 'package:film_zone/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilmZone extends StatelessWidget {
  const FilmZone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Film Zone',
      routerConfig: goRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(scaffoldBackgroundColor: Palette.white),
      builder: (context, router) => AppRouterHolder(
        router: getRouter,
        child: CompositeLoggerHolder(
          compositeLogger: getLogger,
          child: router!,
        ),
      ),
    );
  }
}
