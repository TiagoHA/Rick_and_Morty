import 'dart:async';
import 'package:rick_morty/src/models/characters_model.dart';
import 'package:rick_morty/src/models/episode_model.dart';
import 'package:rick_morty/src/models/location_model.dart';

import 'api_provider.dart';

class Repository {
  final _apiProvider = ApiProvider();

  Future<CharactersModel> fetchAllCharapters() =>
      _apiProvider.fetchAllCharapters();
  Future<Characters> fetchCharacter(int id) => _apiProvider.fetchCharacter(id);

  Future<EposideModel> fetchEpisodes() => _apiProvider.fetchEpisodes();

  Future<LocationModel> fetchLocation() => _apiProvider.fetchLocation();
}
