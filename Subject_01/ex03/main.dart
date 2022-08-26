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
    return MaterialApp(
      title: 'ex02',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _cards = <OneCard>[]; //OneCard객체의 배열
  //final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ex02'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.list),
        //     onPressed: _pushSaved,
        //     tooltip: 'Saved Suggestions',
        //   ),
        // ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final index = i;
          if (index >= _cards.length) {
            _cards.addAll(generateCard(10));
            //_suggestions.addAll(generateWordPairs().take(10));
          }

          //String이 아닌 OneCard객체(객체배열에서 특정 index를 가리키므로 객체)
          final oneCard = _cards[index];

          //final alreadySaved = _saved.contains(_cards[index]);

          return Dismissible(
            key: ValueKey(oneCard.titleContents), //Key는 String Type
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            onDismissed: (direction){
              _cards.remove(oneCard);
            },
            child: _makeCardTile(oneCard, index), //아직 값이 초기화되지 않음
          );
        },
      ),
    );
  }

  List<OneCard> generateCard(int length)
  {
    List<WordPair> _titleContents = generateWordPairs().take(length).toList();
    List<String> _subtitleContents = ['done', 'do not yet'];
    final idx = Random().nextInt(2);

    return List<OneCard>.generate(
        length, (index) => OneCard(
            titleContents: _titleContents[index],
            subtitleContents: _subtitleContents[idx],
            favoriteShape: false,
        )
    );
  }

  Widget _makeCardTile(OneCard oneCard, int index)
  {
    return Card(
        child: ListTile(
          title: Text(oneCard.titleContents.asPascalCase, //객체에서 non-nullable
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          subtitle: Text(oneCard.subtitleContents),
          trailing: Icon(
            oneCard.favoriteShape ? Icons.favorite : Icons.favorite_border,
            color: oneCard.favoriteShape ? Colors.red : null,
            semanticLabel: oneCard.favoriteShape ? 'Remove from saved' : 'Save',
          ),
          onTap: () {
            setState(() {
              _cards[index] = oneCard.copyWith(favoriteShape: !oneCard.favoriteShape);
              // if (oneCard.favoriteShape) {
              //   _saved.remove(oneCard.titleContents.asPascalCase);
              // } else {
              //   _saved.add(oneCard.titleContents);
              // }
            });
          },
        ),
        elevation: 2.0,
    );
  }

  Widget showBackground(int direction) {
   return Container(
     margin: const EdgeInsets.all(4),
     padding: const EdgeInsets.symmetric(horizontal: 10),
     color: Colors.red,
     child: Row(
       mainAxisAlignment:
        direction == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
       children: [
         Text('Remove',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.white,
          ),
         ),
       ],
     ),
   );
  }

  //추후 다시 구현해보기
  void _pushSaved() {
    //Navigator스택에 즐겨찾기한 문장을 push(), pop()은 별도 구현필요없음
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

class OneCard{
  //멤버변수
  final WordPair titleContents;
  final String subtitleContents;
  final bool favoriteShape;

  //생성자
  OneCard({
    required this.titleContents,
    required this.subtitleContents,
    required this.favoriteShape
  });

  //함수
  OneCard copyWith({
    String? id,
    WordPair? titleContents,
    String? subtitleContents,
    bool? favoriteShape
  })
  {
    return OneCard( //함수의 반환타입이 클래스(null값이면 으론쪽 값을 대입)
      titleContents: titleContents ?? this.titleContents,
      subtitleContents: subtitleContents ?? this.subtitleContents,
      favoriteShape: favoriteShape ?? this.favoriteShape,
    );
  }
}