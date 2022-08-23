import 'package:flutter/material.dart';
import 'package:poketmonster/poketmon_details.dart';

void main() => runApp(MyApp());


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

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.amber[200],
      drawer: _buildDraw(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildBody(_selectedIndex),
        ],
      )//_buildBody(),
    );
  }

  List _widgetOptions = [
    Text("Pikachu"),
    Text("Caterpie"),
  ];

  BottomNavigationBar _buildBottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.electric_bolt),
            label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grass),
          label: ''
        ),
      ],
    );
  }

}

//_buildAppBar
class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  _buildAppBar({this.pageInstanceFunction, this.selectedIndex = 0});
  var pageInstanceFunction;
  int selectedIndex;

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


//_buildBody
PocketmonDetails _buildBody(int _selectedIndex){
  return PocketmonDetails(
      selectedIndex: _selectedIndex,
      imageURL: 'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800',
  );
}


//_buildDraw
class _buildDraw extends StatefulWidget {
  const _buildDraw({Key? key}) : super(key: key);

  @override
  State<_buildDraw> createState() => _buildDrawState();
}

class _buildDrawState extends State<_buildDraw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader( //Drawer 상단에 유저프로필이 들어가는 곳
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/85a954df-43b3-4b66-9e8d-94fe01b0451f/da9k0wb-1ae6c8d8-0b1f-46db-a6c9-3f9b44fc29bc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg1YTk1NGRmLTQzYjMtNGI2Ni05ZThkLTk0ZmUwMWIwNDUxZlwvZGE5azB3Yi0xYWU2YzhkOC0wYjFmLTQ2ZGItYTZjOS0zZjliNDRmYzI5YmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ySQkI8GmpoOQ3KvsCwlwXd1l_QjJ7DsuqmcGP9fwnsE').image,
              radius: 100.0,
            ),
            accountName: Text('AshKetchum',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            accountEmail: Text('AshKetchum@pocketmonmaster.com',
              style: TextStyle(
                color: Colors.white,
              ),),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.redAccent,
                  Colors.blueAccent,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
          ),
          ListTile( //1
            leading: Icon(
              Icons.local_hospital,
              color: Colors.grey[850],
            ),
            title: Text(
              'Pocketmon Center',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              print('Center');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.support_agent,
              color: Colors.grey[850],
            ),
            title: Text(
              'Support',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              print('Support');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.grey[850],
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              print('Logout');
            },
          ),
        ],
      ),
    );
  }
}

