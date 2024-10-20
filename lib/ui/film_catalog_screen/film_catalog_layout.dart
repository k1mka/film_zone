import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_bloc.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_events.dart';
import 'package:film_zone/ui/film_catalog_screen/bloc/film_catalog_states.dart';
import 'package:film_zone/ui/widgets/input_field_widget.dart';
import 'package:film_zone/ui/widgets/pages/empty_state_widget.dart';
import 'package:film_zone/ui/widgets/pages/initial_page.dart';
import 'package:film_zone/ui/widgets/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilmCatalogLayout extends HookWidget {
  const FilmCatalogLayout({super.key});

  void _handleSearch({
    required String query,
    required BuildContext context,
    required List<FilmModel> currentFilms,
    int currentPage = 1,
  }) {
    context.read<FilmCatalogBloc>().add(
      SearchCatalogEvent(
        query: query,
        currentPage: currentPage,
        currentFilms: currentFilms,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final films = useState<List<FilmModel>>([]);
    final controller = useTextEditingController();
    final scrollController = useScrollController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Tokens.spacer24,
              InputFieldWidget(
                controller: controller,
                onChanged: (query) {
                  _handleSearch(
                    query: query,
                    context: context,
                    currentFilms: films.value,
                  );
                },
              ),
              BlocConsumer<FilmCatalogBloc, FilmCatalogState>(
                listener: (context, state) {
                  if (state is LoadedCatalogState) {
                    films.value = state.films;
                  }
                },
                builder: (context, state) {
                  return Expanded(
                    child: switch (state) {
                      InitialCatalogState() => const InitialPage(),
                      ErrorCatalogState() => Text(state.exception.toString()),
                      LoadedCatalogState() => LoadedCatalogPage(
                        films: films.value,
                        scrollController: scrollController,
                        onScrollEnd: (currentPage) {
                          _handleSearch(
                            query: controller.text,
                            currentFilms: films.value,
                            context: context,
                            currentPage: currentPage,
                          );
                        },
                      ),
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
