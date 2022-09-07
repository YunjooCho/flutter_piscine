import 'package:json_annotation/json_annotation.dart';

part 'movie_page.g.dart';

@JsonSerializable()
class MovieList{
  List<MoviePage>? list;

  MovieList({
    required this.list,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}

@JsonSerializable()
class MoviePage { //파일명의 이름을 따와서 생성
  final String posterPath;

  MoviePage({
    required this.posterPath,
  });

  factory MoviePage.fromJson(Map<String, dynamic> json) =>
      _$MoviePageFromJson(json);

  Map<String, dynamic> toJson() => _$MoviePageToJson(this);
}