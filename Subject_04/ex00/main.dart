import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: '나우누리에 오신 것을 환영합니다',
      toolbar: Toolbar95(
        actions: [
          Item95(
            label: 'File',
            //onTap: () {},
          ),
          Item95(
            label: 'Edit',
            //onTap: () {},
          ),
          Item95(
            label: 'Save',
            //onTap: () {},
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Elevation95(
            type: Elevation95Type.down,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10, width: double.infinity),
                Image.asset(
                  'assets/logo.jpg',
                  height: 50.0,
                ),
                const SizedBox(height: 10),
                Button95(
                  child: Center(
                      child: Text(
                    '1.안내/가입    2.전자우편    3.게시판',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  )),
                  height: 70.0,
                  onTap: () {
                    showDialog95(
                      context: context,
                      title: 'Error',
                      message: 'Task failed successfully',
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                //_buildListView(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 7.0),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Elevation95(
            type: Elevation95Type.up,
            child: Text(
              '번호  제목',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                inherit: false,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
