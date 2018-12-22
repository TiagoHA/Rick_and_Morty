import 'dart:collection';

import 'package:rick_morty/src/providers/bloc_provider.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rick_morty/src/models/characters_model.dart';

class CharactersBloc extends BlocBase {
  final _repository = Repository();
  final _charactersFetcher = BehaviorSubject<CharactersModel>();

  Observable<CharactersModel> get allCharapters => _charactersFetcher.stream;

  fetchAllCharapters() async {
    CharactersModel _charapters = await _repository.fetchAllCharapters();
    print('CharaptersBLOC: ${_charapters.toString()}');
    _charactersFetcher.sink.add(_charapters);
  }

  void dispose() {
    _charactersFetcher.close();
  }
}

final charsBloc = CharactersBloc();
