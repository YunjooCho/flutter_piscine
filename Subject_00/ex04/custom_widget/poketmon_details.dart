import 'package:flutter/material.dart';

class PocketmonDetails extends StatelessWidget {

  String? imageURL;

  PocketmonDetails({Key? key, this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //두 개의 텍스트 시작점을 맞춰서 정렬
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: Image.network('$imageURL').image,
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
              height: 8.0,
            ),
            Text('Pikachu',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 간격
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text('Level',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Lv.4',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 간격
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 16.0,
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
                Text('Eletric Shocks'),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('Electro Ball'),
              ],
            ),
          ],
        ),
      )
    );
  }
}