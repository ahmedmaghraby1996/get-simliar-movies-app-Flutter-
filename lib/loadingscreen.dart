import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body: Center(
     child: CircularProgressIndicator(),
   ) ,
 );
  }

}