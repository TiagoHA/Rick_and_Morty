import 'dart:async';
import 'package:rick_morty/src/model/characters_model.dart';
import 'package:rick_morty/src/model/episode_model.dart';
import 'package:rick_morty/src/model/location_model.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<CharactersModel> fetchCharacters() => apiProvider.fetchCharacters();
  Future<Characters> fetchCharacter(int id) => apiProvider.fetchCharacter(id);

  Future<EposideModel> fetchEpisodes() => apiProvider.fetchEpisodes();

  Future<LocationModel> fetchLocation() => apiProvider.fetchLocation();
}
