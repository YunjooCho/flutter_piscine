import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

//_buildBody
class outputPage extends StatefulWidget {
  const outputPage({Key? key, this.bmi}) : super(key: key);

  final bmi;

  @override
  State<outputPage> createState() => outputPageState();
}

class outputPageState extends State<outputPage> {
  double maxValue = 45.0;

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
                interval: 5, //숫자간 간격
                showLastLabel: true, //마지막 수치가 출력
                majorTickStyle: MajorTickStyle( //게이지 안쪽 긴 선
                  length: 8,
                ),
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0, endValue: 18.5, color: Colors.lightBlue, label: '저체중',),
                  GaugeRange(
                      startValue: 18.5, endValue: 25.0, color: Colors.green, label: '정상',),
                  GaugeRange(
                      startValue: 25.0, endValue: 30.0, color: Colors.orange, label: '과체중',),
                  GaugeRange(
                    startValue: 30.0, endValue: 35.0, color: Colors.pink, label: '비만',),
                  GaugeRange(
                    startValue: 35.0, endValue: 45.0, color: Colors.red, label: '고도비만',),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(//바늘부분
                    enableAnimation: true,
                    value: widget.bmi,
                    needleColor: Colors.black,
                    knobStyle: const KnobStyle(color: Colors.black),
                  )
                ],
            )
          ]
          ),
        ],
      ),
    );
  }
}