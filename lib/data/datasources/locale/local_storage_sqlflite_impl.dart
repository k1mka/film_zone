import 'dart:async';
import 'package:film_zone/data/models/film_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:film_zone/data/datasources/locale/local_storage.dart';

class LocalStorageSQLFliteImpl implements LocalStorage {
  static final LocalStorageSQLFliteImpl _instance = LocalStorageSQLFliteImpl._internal();

  factory LocalStorageSQLFliteImpl() => _instance;

  static Database? _database;

  LocalStorageSQLFliteImpl._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'films.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE films (
            id INTEGER PRIMARY KEY,
            title TEXT,
            overview TEXT,
            release_date TEXT,
            adult INTEGER,  -- 0 (false) или 1 (true)
            backdrop_path TEXT,
            genre_ids TEXT, -- JSON строка для списка
            original_language TEXT,
            original_title TEXT,
            popularity REAL,
            poster_path TEXT,
            video INTEGER, -- 0 (false) или 1 (true)
            vote_average REAL,
            vote_count INTEGER
          )
        ''');
      },
    );
  }

  @override
  Future<void> saveFilms(List<FilmModel> films) async {
    try {
      final db = await database;
      for (var film in films) {
        await db.insert(
          'films',
          _filmToMap(film),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<FilmModel>> getCachedFilms() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('films');

    return List.generate(maps.length, (i) {
      return FilmModel.fromJson(maps[i]);
    });
  }

  @override
  Future<void> clearFilms() async {
    final db = await database;
    await db.delete('films');
  }

  Map<String, dynamic> _filmToMap(FilmModel film) {
    return {
      'id': film.id,
      'title': film.title,
      'overview': film.overview,
      'release_date': film.releaseDate,
      'backdrop_path': film.backdropPath,
      'original_language': film.originalLanguage,
      'original_title': film.originalTitle,
      'popularity': film.popularity,
      'poster_path': film.posterPath,
      'vote_average': film.voteAverage,
      'vote_count': film.voteCount,
    };
  }
}
