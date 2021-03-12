import 'package:flutter/material.dart';
import 'package:similar_movie_app/movieprovider.dart';
import 'package:similar_movie_app/search.dart';
import 'package:similar_movie_app/trending.dart';
import 'package:provider/provider.dart';

void main() {


  runApp(
      ChangeNotifierProvider(create: (_)=>MovieProvider(),child: MyApp(),)

      );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
routes:{ "/trend":(context)=>Trending()},
      theme: ThemeData(

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int currentindex=0;
changetap(int index){
  setState(() {
    currentindex=index;
  });
}
  @override
  Widget build(BuildContext context) {

        return

          Scaffold(

              bottomNavigationBar: BottomNavigationBar(
                onTap: changetap,
                currentIndex: currentindex,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.trending_up),label: "Trending"),
                  BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search" ),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite),label:"Watchlist" )
                ],

              ),
              body:currentindex==0?Trending():currentindex==1?Search_Screen():null
          );





}
}
