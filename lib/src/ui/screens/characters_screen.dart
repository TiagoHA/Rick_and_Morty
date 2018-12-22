import 'package:flutter/material.dart';
import 'package:rick_morty/src/blocs/characters_bloc.dart';
import 'package:rick_morty/src/models/characters_model.dart';
import 'package:rick_morty/src/resources/repository.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    charsBloc.fetchAllCharapters();
    super.initState();
  }

  @override
  void dispose() {
    charsBloc.dispose();
    super.dispose();
  }

  final _repository = Repository();
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Characters'),
        ),
        body: StreamBuilder(
            stream: charsBloc.allCharapters,
            builder: (context, AsyncSnapshot<CharactersModel> snapshot) {
              if (snapshot.hasData) {
                return CharsList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget CharsList(AsyncSnapshot<CharactersModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          print('Snapshot.Data');
          print(snapshot.data.toJson());
          final char = snapshot.data.results[index];
          print('INDEX $index');
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: GridTile(
                footer: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.black.withOpacity(0.6),
                  child: Text(
                    char.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                child: InkResponse(
                    enableFeedback: true,
                    child: Image.network(
                      char.image,
                    ))),
          );
        });
  }
}
