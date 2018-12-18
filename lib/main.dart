import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rick_morty/src/model/characters_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty - Bibiografia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Rick and Morty - Bibiografia'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  static Options options = Options(
      baseUrl: "https://rickandmortyapi.com/api",
      connectTimeout: 5000,
      receiveTimeout: 3000);

  Dio dio = Dio(options);
  Future<List<Characters>> _getCharacters() async {
    Response response = await dio.get("/character");
    GetCharacters characters = GetCharacters.fromJson(response.data);
    characters.results.map((char) {
      print('Nome: ${char.name.toString()}');
      return char.name;
    }).toList();
    return characters.results;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _getCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
