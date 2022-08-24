import 'package:flutter/material.dart';

void main() => runApp(MyApp());


//MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ex01',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}


//MyPage
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}



//_buildAppBar
class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  _buildAppBar({this.pageInstanceFunction});
  var pageInstanceFunction;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        title: Text('ex01',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, //AppBar의 텍스트 가운데 정렬
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


//_buildBody
class _buildBody extends StatelessWidget {
  const _buildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.symmetric(
              inside: BorderSide(
                  width: 5,
                  color: Colors.black
              )
          ),
          children: [
            TableRow(
              children: [
                Container(
                  height: 160,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          child: Icon(
                            Icons.star,
                            size: 70,
                            color: Colors.grey,
                          ),
                        ),
                        width: 200,
                        height: 160,
                      ),
                      Positioned(
                        child: Container(
                          child: Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        width: 70,
                        height: 160,
                      ),
                      Positioned(
                        child: Container(
                          child: Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        width: 200,
                        height: 40,
                      ),
                      Positioned(
                        child: Container(
                          child: Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        width: 200,
                        height: 260,
                      ),
                      Positioned(
                        child: Container(
                          child: Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                        width: 330,
                        height: 160,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  color: Colors.blue,
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Colors.white,

                      ),
                      Container(
                        height: 100,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.amber,
                  margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
                )
              ],
            ),
          ],
        ),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.yellow,
            ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}
