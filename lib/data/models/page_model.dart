import 'package:film_zone/data/models/film_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_model.freezed.dart';

part 'page_model.g.dart';

@freezed
class PageModel with _$PageModel {
  const factory PageModel({
    required int totalPages,
    required int currentPage,
    required List<FilmModel> films,
  }) = _PageModel;

  factory PageModel.fromJson(Map<String, dynamic> json) => _$PageModelFromJson(json);

  factory PageModel.empty() => const PageModel(
        currentPage: 0,
        totalPages: 0,
        films: [],
      );
}
