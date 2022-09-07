import 'package:flutter/material.dart';
import 'dart:convert';
import 'custom_widget/movie_page.dart'; //★★★

//폰트 설정
//[1] 원하는 폰트를 다운로드하여 assets/fonts 디렉토리 생성 후,
//    해당 폴더에 다운로드한 폰트를 넣어줌
//[2] pubspec.yaml에서 font부분 주석 해제(들여쓰기 주의)
//    pub get 실행
//[3] main.dart에서 ThemeData부분에 fontFamily 설정

List<Map<String, String>> movieData = [
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/1Lh9LER4xRQ3INFFi2dfS2hpRwv.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/oF80bdLeRri6PFm0yAT0gRNQoDG.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/8SAWREjfLyArr2pYo1gHihCthY8.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/1UkbPQspPbq1FPbFP4VV1ELCfSN.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/aNtAP8ZzUMdnCPoqYgVOcgI0Eh4.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/yXNVcG0C7Oymg9F9ecXa9MWVwj8.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/68ZwnPALUeweaFdT1z75oXJ4Xie.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/l8HyObVj8fPrzacAPtGWWLDhcfh.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/bZrStEjqKMRCywomPZiPkOWZpXL.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/qfB6QNaCtmGDy9ujvBOUs7UaPx.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/eRLlrhbdYE7XN6VtcZKy6o2BsOw.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/52SgH0kLiSpWdJDOZvhAyy34uhe.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/yjdOpEtlzlAnw4Kw0NGw25VrbIb.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/xs7Dx72wr2H14uxu0H0R9ljDZk7.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/zPDY58lk0YIxr9qsnGV64PEnjkI.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/pMyOSRURkxF6YId9vOTGsBH1jRb.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/jlmuSzTXOppShgYZbeetWTFTi6P.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/xJY3ttefDnnn6doYQo5QOROgdvV.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/w7PJ7fBEYOuaAMKfYa4zmw45v3N.jpg>'},
  {'posterPath' : '<https://image.tmdb.org/t/p/w500/AviYDX3NuuyVQdZoLmLxNKp3zm8.jpg>'},
];
MovieList? movieList;
//★★★

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'text',
      ),
      home: MyPage(title: 'Movie Poster'),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    //★★★
    movieList = MovieList.fromJson(movieData);
    //Map<String, String> movieMap = jsonDecode(movieData.elementAt(index));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
          style: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Movie of the Week',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              ),
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //childAspectRatio: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Image.network(
                      //★★★
                      movieList.elementAt(index).posterPath!,
                      //'',
                    ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

