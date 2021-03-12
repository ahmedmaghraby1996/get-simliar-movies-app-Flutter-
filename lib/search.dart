

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:similar_movie_app/loadingscreen.dart';
import 'package:similar_movie_app/movieprovider.dart';
import 'package:similar_movie_app/searchresults.dart';
import 'package:similar_movie_app/trending.dart';

class Search_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return Search_Screen_State();
  }

}
class Search_Screen_State extends State<Search_Screen>{
  String title="";
  @override
  Widget build(BuildContext context) {

   return

     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Center(
         child: Column(

           children: [

             SizedBox(height: 40),
             TextFormField(
               decoration:InputDecoration(
                 labelText: "Similar Movies",
                 hintText: "enter movie name",

               ) ,
               onChanged: (value){
                 setState(() {
                   title=value;
                   print(title);
                 });
               },
             ),
             Builder(
               builder:(BuildContext ctx) { return FlatButton(

                 onPressed:(){

                 print(title);
                 // Navigator.of(ctx).push(MaterialPageRoute(builder: (_){return LoadingScreen();}));

                 Provider.of<MovieProvider>(ctx,listen: false).getsimilar(title).then((_){
                   Navigator.of(ctx).push(MaterialPageRoute(builder: (_){return SerachResults();}));

                 });
               } , child: Text("Search"),splashColor: Colors.amberAccent,);},
             )
           ],
         ),
       ),

   );

  }

}

