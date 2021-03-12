import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:similar_movie_app/movieprovider.dart';
import 'package:similar_movie_app/results.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:flutter/material.dart';

import 'cast.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

print("test");
    String id = Provider.of<MovieProvider>(context).movieid;
    int idd = Provider.of<MovieProvider>(context).idd;
    List<Cast> cast = Provider.of<MovieProvider>(context).cast;
    print("name is ${cast[1].name}");
    Results movie;
   if( Provider.of<MovieProvider>(context)
        .check==false){

   movie = Provider.of<MovieProvider>(context)
        .results
        .where((element) => element.id == idd)
        .toList()[0];}
   else{
      movie = Provider.of<MovieProvider>(context)
         .smiliar
         .where((element) => element.id == idd)
         .toList()[0];


   }
   print(Provider.of<MovieProvider>(context)
       .check.toString());
    var controllor = YoutubePlayerController(
        initialVideoId: id,
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ));

    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

SizedBox(height: 10,),
               YoutubePlayer(

                  controller: controllor,


               ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(movie.title,style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),textAlign: TextAlign.start,),
        )
, SizedBox(height: 10,),
        Card(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movie.poster_path}",
                        fit: BoxFit.fill,
                        height: 150,
                        width: 100,
                      ),
                      Container(
                        width: 250,
                        child: Text(

                          movie.overview,softWrap: true,overflow:TextOverflow.clip ,style: GoogleFonts.oswald(color: Colors.black54,),
                        ),
                      ),





                    ],
                  ),
          ),
        ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Cast",style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
            ),
            SizedBox(height: 10,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Card(
                 child: Row(


                   children: [
                    ...cast.map((e) => Card(

                      child: Container(
                        width: 150,
                        child: Column(

                          children: [
                            Image.network( "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${e.profile_path}",fit: BoxFit.fill,height: 200,width: 150,),
                            Text(e.name,overflow: TextOverflow.ellipsis,softWrap: false,),
                            Text(e.character,style: TextStyle(color: Colors.black54),softWrap: false,overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    ),


                    ).toList(),
                  ],
                  ),
               ),
             ),


          ],
        ),
      ),
    );
  }
}
