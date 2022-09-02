import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calculator/custom_widget/bmi_input_page.dart';
import 'package:bmi_calculator/custom_widget/bmi_output_page.dart';

void main() => runApp(MyApp());

//MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyPage(),
    );
  }
}

//MyPage
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //     onTap: () => FocusScope.of(context).unfocus(),
    //    child: Scaffold(
      return Scaffold(
          appBar: _buildAppBar(),
          body: inputPage(),
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
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
