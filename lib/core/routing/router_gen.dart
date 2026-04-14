import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorbloc/business_logic/cubit/rickandmory_cubit.dart';
import 'package:rickandmorbloc/core/routing/app_routes.dart';
import 'package:rickandmorbloc/data/repository/character_repository.dart';
import 'package:rickandmorbloc/data/web_services/characters_web_services.dart';
import 'package:rickandmorbloc/presentation/screen/characters_screen.dart';
import 'package:rickandmorbloc/presentation/screen/dimensions_screen.dart';
import 'package:rickandmorbloc/presentation/screen/episode_screen.dart';
import 'package:rickandmorbloc/presentation/screen/home_screen.dart';

class RouterGenerate {
  late CharactersRepository charactersRepository;
  late RickandmoryCubit rickandmoryCubit;

  RouterGenerate() {
    charactersRepository = CharactersRepository(
      charactersWebServices: CharactersWebServices(),
    );
    rickandmoryCubit = RickandmoryCubit(
      charactersRepository: charactersRepository,
    );
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                RickandmoryCubit(charactersRepository: charactersRepository),
            child: const CharactersScreen(),
          ),
        );

      case AppRoutes.episodeScreen:
        return MaterialPageRoute(builder: (_) => const EpisodeScreen());

      case AppRoutes.dimensionsScreen:
        return MaterialPageRoute(builder: (_) => const DimensionsScreen());

      default:
        return null;
    }
  }
}
