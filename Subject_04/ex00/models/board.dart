class Board {
  final int userId;
  final int id;
  final String title;
  final String body;

  Board({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  Board.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
    'userId' : userId,
    'id' : id,
    'title' : title,
    'body' : body,
  };
}