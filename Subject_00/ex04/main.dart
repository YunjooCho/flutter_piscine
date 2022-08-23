import 'package:flutter/material.dart';
import 'package:poketmonster/poketmon_details.dart';

void main() => runApp(MyApp());


//AppBar클래스 (요구사항)
class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  _buildAppBar({this.pageInstanceFunction});
  var pageInstanceFunction;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        title: Text('My Pocket',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pocket',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.amber[200],
      body: _buildBody(),
    );
  }
}


   PocketmonDetails _buildBody(){
     return PocketmonDetails(
       imageURL: 'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800',
     );
   }




