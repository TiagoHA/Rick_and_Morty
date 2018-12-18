import 'dart:async';
import 'package:dio/dio.dart';
import 'package:rick_morty/src/model/characters_model.dart';
import 'package:rick_morty/src/model/episode_model.dart';
import 'package:rick_morty/src/model/location_model.dart';

class ApiProvider {
  static final dio = Dio(options);
  static final options = Options(
      baseUrl: "https://rickandmortyapi.com/api",
      connectTimeout: 5000,
      receiveTimeout: 3000);

  Future<CharactersModel> fetchCharacters() async {
    final response = await dio.get("/character");
    if (response.statusCode == 200) {
      return CharactersModel.fromJson(response.data);
    }
    throw Exception('Failed to load characters');
  }

  Future<Characters> fetchCharacter(int id) async {
    final response = await dio.get("/character/id");
    if (response.statusCode == 200) {
      return Characters.fromJson(response.data);
    }
    throw Exception('Failed to load characters');
  }

  Future<EposideModel> fetchEpisodes() async {
    final response = await dio.get('/episode');
    if (response.statusCode == 200) {
      return EposideModel.fromJson(response.data);
    }
    throw Exception('Failed to load episodes');
  }

  Future<LocationModel> fetchLocation() async {
    final response = await dio.get('/location');
    if (response.statusCode == 200) {
      return LocationModel.fromJson(response.data);
    }
    throw Exception('Failed to load episodes');
  }
}
