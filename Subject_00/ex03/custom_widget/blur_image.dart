import 'package:flutter/material.dart';

class BlurImage extends StatelessWidget {
  String? image1_url;
  String? image2_url;

  BlurImage({Key? key, this.image1_url, this.image2_url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          //상단의 그림이 잘리는 것을 방지
          child: SingleChildScrollView(
            //화면범위를 넘어가는 경우 자동으로 스크롤 생성
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, //이미지들을 가운데 정렬
              children: [
                Image.network(
                  '$image1_url',
                  //"https://w.namu.la/s/420422c9668360c3654fb8d4ba4b4921a22a8732d660e08d81cfa5281035aae6573a4f61927aaeecdcf6ee911af6ea5a4aa49bef54be3f63ada78ac5f914e1cfb4b78e644e2190944fb886f2688ffb91",
                  fit: BoxFit.cover,
                ),
                Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.5, 1.0], //블러처리 되는 범위?
                      colors: [
                        Colors.black.withOpacity(1.0), // 1/4지점(꼭대기) 부분 투명도
                        Colors.black.withOpacity(0.0), // 2/4지점 투명도
                        Colors.black.withOpacity(0.0), // 3/4지점 투명도
                        Colors.black.withOpacity(1.0), // 4/4지점(바닥) 투명도
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
                              '$image2_url',
                              //"https://uyjoqvxyzgvv9714092.cdn.ntruss.com/data2/content/image/2021/10/07/.cache/512/20211007320109.jpg"
                            ))),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //텍스트 시작점 정렬
                  children: [
                    Text(
                      'Title: Squid Game 2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      //텍스트 간의 간격 조정
                      height: 5.0,
                    ),
                    Text(
                      'Episodes: 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      //텍스트 간의 간격 조정
                      height: 5.0,
                    ),
                    Text(
                      'Ganre : TV Drama',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      //텍스트 간의 간격 조정
                      height: 5.0,
                    ),
                    Text(
                      'Piot: Seong Gi-hun, a divorced and indebted chauffeur, is\n'
                      'invited to play a series of children\'s games for a chance at a\n'
                      'large cash prize. Accepting the offer,he is taken to an unknown\n'
                      'location where he finds himself among 456 players who are all\n'
                      'deeply in debt. The players are made to wear green tracksuites.\n'
                      'and are kept under watch at all times by masked guards in pink\n'
                      'jumpsuits with the games overseas by the Front Man, who\n'
                      'wears a black mask and black uniform.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
