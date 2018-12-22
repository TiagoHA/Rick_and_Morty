import 'package:flutter/material.dart';
import 'package:rick_morty/src/blocs/characters_bloc.dart';
import 'package:rick_morty/src/providers/bloc_provider.dart';
import 'package:rick_morty/src/resources/repository.dart';
import 'package:rick_morty/src/ui/screens/characters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Rick and Morty - Bibiografia';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty - App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharactersScreen(title: 'Rick and Morty - Bibiografia'),
    );
  }
}
