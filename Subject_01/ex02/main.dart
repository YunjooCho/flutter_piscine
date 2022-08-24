import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold제거(_RandomWordsState에서 설정)
    return MaterialApp(
      // MODIFY with const
      title: 'Startup Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: RandomWords(), // REMOVE Scaffold
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  List<String> subtitle_contents = ['done', 'do not yet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ex02'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final index = i;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          
          final alreadySaved = _saved.contains(_suggestions[index]);
          int idx = Random().nextInt(2);
          String sub_contents = subtitle_contents[idx];
          
          return Card(
            child: ListTile(
            title: Text(
                _suggestions[index].asPascalCase,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                )
            ),
            subtitle: Text(sub_contents),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          ),
          );
        },
      ),
    );
  }

  void _pushSaved() { //Navigator스택에 즐겨찾기한 문장을 push(), pop()은 별도 구현필요없음
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}