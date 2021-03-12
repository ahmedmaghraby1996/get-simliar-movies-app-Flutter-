import 'package:flutter/cupertino.dart';

class Results {
  String overview,
      release_date,
      original_title,
      title,
      poster_path,
      media_type,
      backdrop_path;
  int id;
  double vote_average;

  Results(
      {@required this.title,
      @required this.id,
      @required this.media_type,
      @required this.original_title,
      @required this.overview,
      @required this.poster_path,
      @required this.release_date,
      @required this.backdrop_path,
      @required this.vote_average});

  factory Results.fromJson(Map<String, dynamic> jsondata) {
    return Results(
        title: jsondata["title"],
        id: jsondata["id"],
        media_type: jsondata["media_type"],
        original_title: jsondata["original_title"],
        overview: jsondata["overview"],
        poster_path: jsondata["poster_path"],
        release_date: jsondata["release_date"],
        backdrop_path: jsondata["backdrop_path"],
        vote_average: jsondata["vote_average"]);
  }
}
