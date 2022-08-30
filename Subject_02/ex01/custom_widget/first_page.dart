import 'package:flutter/material.dart';
import 'package:navigator/custom_widget/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Go to Second Page'),
          onPressed: () {
            Navigator.push(context2, MaterialPageRoute(builder: (context) => SecondPage())); //하단 주석 참조
            //Navigator.of(context2).push(_createRoute());
          },
        ),
      ),
    );
  }

  
  //Tween - 아래로 내려가는 애니매이션 시도했으나 잘 안됨
  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = Offset(0.0, 1.0);
  //       var end = Offset.zero;
  //       var tween = Tween(begin: begin, end: end);
  //       var offsetAnimation = animation.drive(tween);
  //       return child;
  //     },
  //   );
  // }

}

/** Navigator **/
// Navigator.push(context2, MaterialPageRoute(
//   builder:(BuildContext context){
//       return SecondPage();
//     }
//   )
// )