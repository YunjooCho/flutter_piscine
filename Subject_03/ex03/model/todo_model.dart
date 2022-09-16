import 'package:json_annotation/json_annotation.dart';

// part 'todo_model.g.dart';
//
// @JsonSerializable()
class TodoModel {
  final String userId;
  final int id;
  final String title;
  final bool complete;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.complete
  });

  TodoModel.fromJson(Map<String, dynamic> json)
    : userId = json['userId'],
      id = json['id'],
      title = json['title'],
      complete = json['complete'];

  Map<String, dynamic> toJson() => {
    'userId' : userId,
    'id' : id,
    'title' : title,
    'complete' : complete,
  };

  // factory TodoModel.fromJson(Map<String, dynamic> json) =>
  //     _$TodoModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}