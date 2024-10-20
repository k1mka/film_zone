import 'package:film_zone/film_zone.dart';
import 'package:film_zone/setup_service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  serviceLocator();
  runApp(const FilmZone());
}
