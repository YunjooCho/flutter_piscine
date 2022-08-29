import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check In',
      home: MyHomePage(),
    );
  }
}

//MyHomePage
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector( //★★★★★ 작동안하는 이유??
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(onSubmit: (value) => print(value)),
      ),
    );
  }
}

//_buildAppBar
class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _buildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        title: Text(
          'Check In',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

//_buildBody
class _buildBody extends StatefulWidget {
  const _buildBody({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<_buildBody> createState() => _buildBodyState();
}

class _buildBodyState extends State<_buildBody> {
  // 텍스트에디팅컨트롤러를 생성하여 필드에 할당(TextField의 text를 얻기 위해)
  final _controller = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.(누수 방지)
    _controller.dispose();
    super.dispose();
  }

  // _errorText
  String? get _errorText {
    final text = _controller.value.text;

    if (text.isEmpty || text == ' ') {
      return '입력이 올바르지 않습니다.';
    }
    return null;
  }

  //버튼을 눌렀을 때만 에러메시지가 표시되게 함(본 함수부분을 적용하도록 설정하지 않으면 처음부터 에러메시지가 뜸)
  String? _submit() {
    setState(() => _submitted = true);
    if (_errorText == null) {
      widget.onSubmit(_controller.value.text);
    }
    return _controller.value.text;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, TextEditingValue value, __) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '카드 번호를 입력하세요.',
                  errorText: _submitted ? _errorText : null,
                  border: OutlineInputBorder(),
                ),
              ),
              Divider(
                height: 60.0,
                thickness: 1.0,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        child: Text('CHECK IN'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          final _result = _submit();
                          if (_result == "42") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Check in Sucess'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Check in Fail'),
                              ),
                            );
                          }
                          //_controller.value.text.isNotEmpty ? _submit : null, //공란일 때 버튼 비활성화 기능
                        }),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
