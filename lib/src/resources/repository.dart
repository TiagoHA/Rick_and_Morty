import 'dart:async';
import 'package:rick_morty/src/model/characters_model.dart';
import 'package:rick_morty/src/model/episode_model.dart';
import 'package:rick_morty/src/model/location_model.dart';

import 'api_provider.dart';

class Repository {
  final _apiProvider = ApiProvider();

  Future<CharactersModel> fetchCharacters() => _apiProvider.fetchCharacters();
  Future<Characters> fetchCharacter(int id) => _apiProvider.fetchCharacter(id);

  Future<EposideModel> fetchEpisodes() => _apiProvider.fetchEpisodes();

  Future<LocationModel> fetchLocation() => _apiProvider.fetchLocation();
}
