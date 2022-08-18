import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Stateless? or Stateful?'),
    );
  }
}

//AppBar 사용자 정의 함수(요구사항)
class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  _buildAppBar({this.pageInstanceFunction});
  var pageInstanceFunction;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        title: Text('Stateless? or Stateful?'),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() //Stateful 위젯이 이 위젯트리에 삽입될 때 한 번 호출되는 메서드, 초기화 작업 시 사용
  {
    super.initState();
    _counter = 41; //★★★요구사항에 맞는지??????
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 42)
      {
        ScaffoldMessenger.of(context)
            .showSnackBar(
            SnackBar(
                content: Text('answer to life that the universe and everything')
            )
        );
      }
    });
  }

  void printTitle() {
    print(widget.title);
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
            child: Text("Add"),
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar( //★★★함수가 아니라 생성자....?
        pageInstanceFunction: printTitle,
      ),
      body:_buildBody(),
    );
  }
}
