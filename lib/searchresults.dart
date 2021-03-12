

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:similar_movie_app/results.dart';

import 'details.dart';
import 'loadingscreen.dart';
import 'movieprovider.dart';

class SerachResults extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Results> results;
    bool found= Provider.of<MovieProvider>(context).found;
    if ( found==false ){
     results=Provider.of<MovieProvider>(context).smiliar;}
  return Scaffold(


      body: found==false? ListView(
      itemExtent: 350,
      children: results
          .map(
            (e) =>
                Card(
          child: Builder(
                builder:(context)=> InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) {
                      return LoadingScreen();
                    }));
                    Provider.of<MovieProvider>(context, listen: false).change();
                    Provider.of<MovieProvider>(context, listen: false)
                        .getTralier(e.id)
                        .then((_) {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return Details();
                      }));
                    });


                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:
                            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${e.poster_path}",
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-.9, 1),
                        child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 4,
                                    offset: Offset(1, 1)
                                  // Shadow position
                                ),
                              ],
                            ),
                            height: 150,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2${e.backdrop_path}",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                                fit: BoxFit.fill,
                                height: 150,
                                width: 100,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: Align(
                          alignment: Alignment(-.2, .9),
                          child: Row(

                            children: [
                              Expanded(

                                child: Text(

                                  e.title,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.clip,
                                  softWrap: false,
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      backgroundColor:
                                      Color.fromRGBO(0, 0, 0, .7)),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                child: Text(e.vote_average.toString()),
                                backgroundColor: Colors.redAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),


            ),
      )
          .toList()):Center(
        child: Text("nothing was found"),
      ));
  }

}