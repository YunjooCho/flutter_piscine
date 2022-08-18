import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQUID GAME',
      home: BlurImage(),
    );
  }
}

class BlurImage extends StatelessWidget {
  const BlurImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Container(           //오징어게임 로고
        // child: AspectRatio(
        //   aspectRatio: 0.1,
        // ),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: NetworkImage(
        //           "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Squid_Game_logo.png/330px-Squid_Game_logo.png"
        //       )
        //     )
        //   ),
        // ),
          Container(
           foregroundDecoration:BoxDecoration( //★★★fade out 2개 설정하는 법을 모르겠음.....(윗부분이 안되어 있음)
             gradient: LinearGradient(
               begin: Alignment.bottomCenter,
               end: Alignment.center,
               stops: [0.0, 1],
               colors: [
                Colors.black.withOpacity(1.0),
                Colors.black.withOpacity(0.0)
              ],
            ),
          ),
            child: Container(
              child: AspectRatio(
                aspectRatio: 1.0,
              ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://uyjoqvxyzgvv9714092.cdn.ntruss.com/data2/content/image/2021/10/07/.cache/512/20211007320109.jpg"
                    )
                )
            ),
          ),
        ),
        Text(
          'Title: Squid Game 2021',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        SizedBox(//텍스트 간의 간격 조정
          height: 10.0,
        ),
        Text(
          'Episodes: 1',
           style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        SizedBox(//텍스트 간의 간격 조정
          height: 10.0,
        ),
        Text(
          'Ganre : TV Drama',
           style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        SizedBox(//텍스트 간의 간격 조정
          height: 10.0,
        ),
        Text(
          'Piot: Seong Gi-hun, a divorced and indebted chauffeur, is\n'
          'invited to play a series of children\'s games for a chance at a\n'
          'large cash prize. Accepting the offer,he is taken to an unknown\n'
          'location where he finds himself among 456 players who are all',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        Text(
          'deeply in debt. The players are made to wear green tracksuites.\n'
          'and are kept under watch at all times by masked guards in pink',  //★★★이 이상 글이 안써지는 이유?
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ],
      )
    );
  }
}

