import 'package:film_zone/data/models/film_model.dart';
import 'package:film_zone/data/models/page_model.dart';
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
    final page = useState<PageModel>(PageModel.empty());
    final controller = useTextEditingController();
    final scrollController = useScrollController();

    useEffect(() {
      context.read<FilmCatalogBloc>().add(LoadCachedCatalogEvent());
      return null;
    }, []);

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
                    currentFilms: page.value.films,
                  );
                },
              ),
              BlocConsumer<FilmCatalogBloc, FilmCatalogState>(
                listener: (context, state) {
                  if (state is LoadedCatalogState) {
                    page.value = state.page;
                  }
                  if (state is LoadedCachedState) {
                    page.value = state.page;
                  }
                },
                builder: (context, state) {
                  return Expanded(
                    child: switch (state) {
                      InitialCatalogState() => const InitialPage(),
                      ErrorCatalogState() => Text(state.exception.toString()),
                      LoadedCachedState() || LoadedCatalogState() => LoadedCatalogPage(
                          page: page.value,
                          searchQuery: controller.text,
                          scrollController: scrollController,
                          onScrollEnd: (currentPage) {
                            _handleSearch(
                              query: controller.text,
                              currentFilms: page.value.films,
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
