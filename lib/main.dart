import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/pages/character_catalog.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.appColor),
        debugShowCheckedModeBanner: false,
        home: const CharacterCatalog(),
      ),
    );
