import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/internal/di.dart';
import 'internal/my_app.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}
