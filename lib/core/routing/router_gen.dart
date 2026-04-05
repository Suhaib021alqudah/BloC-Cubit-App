import 'package:flutter/material.dart';
import 'package:rickandmorbloc/core/routing/app_routes.dart';
import 'package:rickandmorbloc/presentation/screen/characters_screen.dart';
import 'package:rickandmorbloc/presentation/screen/dimensions_screen.dart';
import 'package:rickandmorbloc/presentation/screen/episode_screen.dart';
import 'package:rickandmorbloc/presentation/screen/home_screen.dart';

class RouterGenerate {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());

      case AppRoutes.episodeScreen:
        return MaterialPageRoute(builder: (_) => const EpisodeScreen());

      case AppRoutes.dimensionsScreen:
        return MaterialPageRoute(builder: (_) => const DimensionsScreen());

      default:
        return null;
    }
  }
}
