import 'package:http/http.dart' as http;
import 'cast.dart';
import 'results.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

class MovieProvider with ChangeNotifier {
  List<Results> results = List();
  List<Results> smiliar = List();
  List<Cast> cast = List();
  String movieid = "";
  bool check = false,found=true;
  int idd = 0;

  Future<void> getTrend() async {
    print("hello");
    http.Response trend = await http.get(
        "https://api.themoviedb.org/3/trending/movie/day?api_key=6c3b01ae1cd074d6f56568dd389f29c3");
    var obj = jsonDecode(trend.body);

    results = (obj["results"] as List<dynamic>)
        .map((e) => Results.fromJson(e))
        .toList();
    print(results.length.toString());
    notifyListeners();
  }

  getTralier(int id) async {
    idd = id;
    print(id.toString());
    var tralier = await http.get(
        "https://api.themoviedb.org/3/movie/${id}/videos?api_key=6c3b01ae1cd074d6f56568dd389f29c3");
    var obj = jsonDecode(tralier.body);
    movieid = obj["results"][0]["key"];

    print(movieid.toString());
    var castlist = await http.get(
        "https://api.themoviedb.org/3/movie/${id}/credits?api_key=6c3b01ae1cd074d6f56568dd389f29c3");
    var obj2 = jsonDecode(castlist.body);
    cast =
        (obj2["cast"] as List<dynamic>).map((e) => Cast.fromJson(e)).toList();
    notifyListeners();
  }

  getsimilar(String title) async {

    try {
      var response = await http.get(
          "https://api.themoviedb.org/3/search/movie?api_key=6c3b01ae1cd074d6f56568dd389f29c3&query=${title}");
      print(response.statusCode.toString());

      var obj = jsonDecode(response.body);
      Results trans = Results(
          title: obj["results"][0]["title"],
          id: obj["results"][0]["id"],
          media_type: obj["results"][0]["media_type"],
          original_title: obj["results"][0]["original_title"],
          overview: obj["results"][0]["overview"],
          poster_path: obj["results"][0]["poster_path"],
          release_date: obj["results"][0]["release_date"],
          backdrop_path: obj["results"][0]["backdrop_path"],
          vote_average: obj["results"][0]["vote_average"]);
      int id = (obj["results"][0]["id"] as int);
found=false;
      response = await http.get(
          "https://api.themoviedb.org/3/movie/${id}/similar?api_key=6c3b01ae1cd074d6f56568dd389f29c3&page=1");

      var obj1 = jsonDecode(response.body);

      smiliar = (obj1["results"] as List<dynamic>)
          .map((e) => Results.fromJson(e))
          .toList();


      smiliar.insert(0, trans);
      print("yo${smiliar.length.toString()}");
      notifyListeners();
    }
    catch(e){
      found=true;
    }


  }

  change() {
    check = true;
    return check;
  }
}
