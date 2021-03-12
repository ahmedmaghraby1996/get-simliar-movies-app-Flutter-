import 'package:flutter/cupertino.dart';

class Cast {
  String name,profile_path,character;



  Cast({@required this.name, @required this.profile_path,@required this.character});


  factory Cast.fromJson(Map<String, dynamic> jsondata){
    return Cast(name: jsondata["name"], profile_path: jsondata["profile_path"],character: jsondata["character"]);
  }

}