import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_bloc.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_events.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_states.dart';
import 'package:film_zone/ui/widgets/custom_progress.dart';
import 'package:film_zone/ui/widgets/input_field_widget.dart';
import 'package:film_zone/ui/widgets/pages/empty_state_widget.dart';
import 'package:film_zone/ui/widgets/pages/initial_page.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmCatalogLayout extends StatelessWidget {
  const FilmCatalogLayout({super.key});

  void _handleSearch(String query, BuildContext context) =>
      context.read<FilmCatalogBloc>().add(SearchCatalogEvent(query));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Tokens.spacer24,
              InputFieldWidget(
                onChanged: (query) => _handleSearch(query, context),
              ),
              Expanded(
                child: BlocBuilder<FilmCatalogBloc, FilmCatalogState>(
                  builder: (context, state) {
                    return switch (state) {
                      InitialCatalogState() => const InitialPage(),
                      LoadingCatalogState() => const CustomProgress(),
                      ErrorCatalogState() => Text(state.exception.toString()),
                      LoadedCatalogState() => LoadedCatalogPage(films: state.films),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
