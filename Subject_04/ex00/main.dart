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
    final display_cnt = 6;

    return Scaffold95(
      title: '나우누리에 오신 것을 환영합니다.',
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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Elevation95(
              type: Elevation95Type.down,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10, width: double.infinity),
                    Image.asset(
                      'assets/logo.jpg',
                      height: 50.0,
                    ),
                    const SizedBox(height: 13),
                    Button95(
                      child: Center(
                          child: Text(
                        '1.안내/가입    2.전자우편    3.게시판',
                        style: Flutter95.textStyle,
                        // TextStyle(
                        //   fontSize: 15.0,
                        // ),
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
                  ],
                ),
              ),
            ),
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: SizedBox(
              height: 40.0,
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    '번호  제목',
                    style: Flutter95.textStyle,
                    // TextStyle(
                    //   fontSize: 15.0,
                    //   color: Colors.black,
                    //   inherit: false,
                    //   wordspacing
                    // ),
                  ),
                ),
              ]),
            ),
          ),
          //ListView.separated(
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 6, //6
              itemBuilder: (context, i) {
                // if (i >= display_cnt)
                // {
                //
                // }
                return Elevation95(
                  // child: ListTile(
                  //   title: Text('${i + 1} : (response title)'),
                  // ),
                  type: Elevation95Type.up,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '${i + 1} : (response title)',
                      style: Flutter95.textStyle,
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
