import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/custom_widget/bmi_output_page.dart';

class inputPage extends StatefulWidget {
  const inputPage({Key? key}) : super(key: key);

  @override
  State<inputPage> createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  // 텍스트에디팅컨트롤러를 생성하여 필드에 할당(TextField의 text를 얻기 위해)
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  bool showWeight = false;
  //bool submitted = false;

  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.(누수 방지)
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  // _errorHeightText
  String? get errorHeightText {
    final heightText = heightController.value.text;

    if (heightText.isEmpty || heightText == ' ') {
      return 'Input Height';
    }
    return null;
  }

  // _errorWeightText
  String? get errorWeightText {
    final weightText = weightController.value.text;

    if (weightText.isEmpty || weightText == ' ') {
      return 'Input Weight';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Input Height(cm)',
                //errorText: submitted ? errorHeightText : null,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) =>
                  value != null && value.isNotEmpty ? null : errorHeightText,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Input Weight(kg)',
                //errorText: _submitted ? _errorWeightText : null,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) =>
                  value != null && value.isNotEmpty ? null : errorWeightText,
              obscureText: showWeight,
            ),
            SizedBox(height: 20),
            CupertinoSwitch(
              value: showWeight,
              onChanged: (value) => setState(() {
                showWeight = value;
              }),
            ),
            SizedBox(height: 20.0),
            Text('Weight : ${showWeight ? '****' : 'digit'}'),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      child: Text('Calculation'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final height = double.parse(heightController.text);
                          final weight = double.parse(weightController.text);
                          final bmi = weight / pow(height / 100, 2);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => outputPage(bmi: bmi)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error'),
                            ),
                          );
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // //버튼을 눌렀을 때만 에러메시지가 표시되게 함(본 함수부분을 적용하도록 설정하지 않으면 처음부터 에러메시지가 뜸)
  // String? _submit() {
  //   setState(() => _submitted = true);
  //   if (_errorHeightText == null) {
  //     widget.onSubmit(_heightController.value.text);
  //   }
  //   else if (_errorWeightText == null) {
  //     widget.onSubmit(_weightController.value.text);
  //   }
  //   return _heightController.value.text;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(children: [
  //     ValueListenableBuilder(
  //       valueListenable: _heightController,
  //       builder: (context, TextEditingValue value, __) {
  //         return Padding(
  //           padding: EdgeInsets.all(20.0),
  //           child: Column(
  //             children: <Widget>[
  //               TextField(
  //                 controller: _heightController,
  //                 decoration: InputDecoration(
  //                   hintText: 'Input Height(cm)',
  //                   errorText: _submitted ? _errorHeightText : null,
  //                   border: OutlineInputBorder(),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //     ValueListenableBuilder(
  //       valueListenable: _weightController,
  //       builder: (context, TextEditingValue value, __) {
  //         return Padding(
  //           padding: EdgeInsets.all(20.0),
  //           child: Column(
  //             children: <Widget>[
  //               TextField(
  //                 controller: _weightController,
  //                 decoration: InputDecoration(
  //                   hintText: 'Input Weight(cm)',
  //                   errorText: _submitted ? _errorWeightText : null,
  //                   border: OutlineInputBorder(),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 25.0,
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: ElevatedButton(
  //                         child: Text('Calculation'),
  //                         style: ElevatedButton.styleFrom(
  //                           primary: Colors.green,
  //                         ),
  //                         onPressed: () {
  //                           final _result = _submit();
  //                           if {
  //                             ScaffoldMessenger.of(context).showSnackBar(
  //                               SnackBar(
  //                                 content: Text('Check in Fail'),
  //                               ),
  //                             );
  //                           }
  //                           //_controller.value.text.isNotEmpty ? _submit : null, //공란일 때 버튼 비활성화 기능
  //                         }),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   ]);
  //}
}
