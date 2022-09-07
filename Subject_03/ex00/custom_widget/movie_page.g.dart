// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieList _$MovieListFromJson(Map<String, dynamic> json) {
  return MovieList(
    list: (json['list'] as List<dynamic>?)
        ?.map((e) => MoviePage.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieListToJson(MovieList instance) => <String, dynamic>{
      'list': instance.list,
    };

MoviePage _$MoviePageFromJson(Map<String, dynamic> json) {
  return MoviePage(
    posterPath: json['posterPath'] as String,
  );
}

Map<String, dynamic> _$MoviePageToJson(MoviePage instance) => <String, dynamic>{
      'posterPath': instance.posterPath,
    };
