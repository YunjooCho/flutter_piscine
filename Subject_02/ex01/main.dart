import 'package:flutter/material.dart';
import 'package:navigator/custom_widget/first_page.dart';

void main() => runApp(MyApp());

//MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      body: FirstPage(),
    );
  }
}