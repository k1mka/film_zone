import 'package:film_zone/core/env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'film_model.freezed.dart';

part 'film_model.g.dart';

@freezed
class FilmModel with _$FilmModel {
  const factory FilmModel({
    String? backdropPath,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    String? posterPath,
    required String releaseDate,
    required String title,
    required double voteAverage,
    required int voteCount,
  }) = _FilmModel;

  factory FilmModel.fromJson(Map<String, dynamic> json) => _$FilmModelFromJson(json);
}

extension FilmModelX on FilmModel {
  String get posterUrl => posterPath != null ? '${Env.baseImagePath}$posterPath' : '';
}
