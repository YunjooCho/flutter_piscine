import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(MyApp());

//MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluent Guage',
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
      backgroundColor: Colors.grey[900],
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
        title: Text(
          'Fluent Guage',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//_buildBody
class _buildBody extends StatefulWidget {
  const _buildBody({Key? key}) : super(key: key);

  @override
  State<_buildBody> createState() => _buildBodyState();
}

class _buildBodyState extends State<_buildBody> {
  double _currentSliderValue = 0;
  double maxValue = 150.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
      child: Column(
        children: [
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: maxValue,
                interval: 10, //숫자간 간격
                showLastLabel: true, //마지막 수치가 출력
                axisLabelStyle: GaugeTextStyle(color: Colors.white,), //방사형 게이지 안쪽 숫자들
                majorTickStyle: MajorTickStyle( //게이지 안쪽 긴 선
                  color: Colors.white,
                  length: 8,
                ),
                minorTickStyle: MinorTickStyle(//게이지 안쪽 짧은 선
                  color: Colors.white,
                ),
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                  GaugeRange(
                      startValue: 50, endValue: 100, color: Colors.orange),
                  GaugeRange(startValue: 100, endValue: 150, color: Colors.red),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(//바늘부분
                    value: _currentSliderValue,
                    needleColor: Colors.white,
                    knobStyle: KnobStyle(color: Colors.white), //가운데 점(노브) 부분
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(//바늘 하단 수치 부분
                      widget: Container(
                          child: Text(_currentSliderValue.toStringAsFixed(1), //출력되는 수치 설정
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))),
                      angle: 90,
                      positionFactor: 0.5)
                ])
          ]
          ),
          Slider(
            value: _currentSliderValue,
            activeColor: Colors.green,
            max: maxValue,
            //divisions: 5, //나누는 눈금선
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
