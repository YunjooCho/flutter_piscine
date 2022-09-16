import 'package:flutter/material.dart';
import 'package:json2dart/model/todo_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //추후 수정
    String json = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}';
    Map<String, dynamic> todoModelMap = jsonDecode(json);

    return Scaffold(
      appBar: AppBar(
        title: Text('Json2Dart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('title : ${todoModelMap['title']} \n userId : ${todoModelMap['userId']} \n id : ${todoModelMap['id']} \n completed : ${todoModelMap['completed']}'),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Fetch Data'),
              onPressed: () {
                //_fetchData;
              },
            ),
          ),
        ]),
      ),
    );
  }

  // Future<Widget> _fetchData() async{
  //   // final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  //   // final response = await http.get(url);
  //   // print(response.body);
  //   String json = '{ userId: 1, id: 1, title: "delectus aut autem", completed: false }';
  //   Map<String, dynamic> todoModelMap = jsonDecode(json);
  //
  //   return Column(
  //     children: [
  //       Container(
  //         child: Text('title : ${todoModelMap['title']} \n userId : ${todoModelMap['userId']} \n Id : ${todoModelMap['Id']} \n completed : ${todoModelMap['completed']}'),
  //       ),
  //       Divider(
  //         color: Colors.grey,
  //       )
  //     ],
  //   );
  // }
}
