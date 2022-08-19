import 'package:flutter/material.dart';

void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
       title: 'Character Card',
       home: PocketmonDetails(),
     );
   }
//
//   // _buildAppBar() { //★반환타입??
//   //   return AppBar(
//   //     title: Text('My Poket',
//   //       style: TextStyle(
//   //         fontWeight: FontWeight.bold,
//   //       ),
//   //     ),
//   //     backgroundColor: Colors.yellow,
//   //     elevation: 0.0, //AppBar가 떠있는 듯한 효과를 없앰, 높이라는 뜻으로 double형의 숫자로 수치 조절
//   //   );
//   // }
//   //
//   // PocketmonDetails _builBody(){
//   //   return PocketmonDetails(
//   //     imageURL:
//   //       'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800'
//   //   );
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: _buildAppBar(),
//   //     backgroundColor: Colors.yellow[200],
//   //     body: _builBody(),
//   //   );
//   // }
}

class PocketmonDetails extends StatelessWidget {
  const PocketmonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text('My Poket',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0.0, //AppBar가 떠있는 듯한 효과를 없앰, 높이라는 뜻으로 double형의 숫자로 수치 조절
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //두 개의 텍스트 시작점을 맞춰서 정렬
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: Image.network('http://file3.instiz.net/data/file3/2018/08/14/d/7/b/d7b25d5d584d77103901068ed3844b9d.gif').image,
                radius: 100.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Text('Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text('Caterpie',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 간격
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text('Level',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Lv.2',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 간격
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('Body Blow'),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('Struggle'),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('BugBite'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class PocketmonDetails extends StatelessWidget {
//   const PocketmonDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow[200],
//       appBar: AppBar(
//         title: Text('My Poket',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.yellow,
//         elevation: 0.0, //AppBar가 떠있는 듯한 효과를 없앰, 높이라는 뜻으로 double형의 숫자로 수치 조절
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, //두 개의 텍스트 시작점을 맞춰서 정렬
//           children: [
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: Image.network('https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800').image,
//                 radius: 100.0,
//               ),
//             ),
//             Divider(
//               height: 60.0,
//               color: Colors.grey[850],
//               thickness: 0.5,
//               endIndent: 30.0,
//             ),
//             Text('Name',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 3.0,
//             ),
//             Text('Pikachu',
//               style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 2.0, //글자 간격
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//             SizedBox(
//               height: 3.0,
//             ),
//             Text('Level',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text('Lv.4',
//               style: TextStyle(
//                   color: Colors.white,
//                   letterSpacing: 2.0, //글자 간격
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               children: <Widget>[
//                 Icon(Icons.check_circle_outline),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text('Body Blow'),
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Icon(Icons.check_circle_outline),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text('Eletric Shocks'),
//               ],
//             ),
//             Row(
//               children: <Widget>[
//                 Icon(Icons.check_circle_outline),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text('Electro Ball'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

