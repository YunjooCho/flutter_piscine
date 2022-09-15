import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'dart:io';

void main() async{
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  test("http 통신 테스트", () async{
    final response = await http.get(url);

    expect(response.statusCode, 200);
  });
}