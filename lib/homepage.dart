import 'package:codemovie/widgets/topratedpage.dart';
import 'package:codemovie/widgets/trending.dart';
import 'package:codemovie/widgets/tvpage.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'decorationspage/textdec.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendmv =[];
  List topratedmovies =[];
  List tv =[];
  final String apikey ='1ce7f3d3d45e00a0787b5e2351f6646f';
  final accesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxY2U3ZjNkM2Q0NWUwMGEwNzg3YjVlMjM1MWY2NjQ2ZiIsInN1YiI6IjYxZjgzN2MyYWUyODExMDA5NDUzYWM0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xo60W3iwkyYfIR85t_jFwaFcnp0eij4ixYYTLKtO4yo';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async{
    TMDB tmdbcustomlogs = await TMDB(ApiKeys(apikey,accesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      )
    );
    Map trendresults = await tmdbcustomlogs.v3.trending.getTrending();
    Map topretatedresults    = await tmdbcustomlogs.v3.movies.getTopRated();
    Map tvdresults = await tmdbcustomlogs.v3.tv.getPopular();

    print(trendresults);
    setState(() {
      trendmv =trendresults['results'];
      topratedmovies =topretatedresults['results'];
      tv=tvdresults['results'];
    });
    //print(trendmv); //for showing content of trending movies in the terminal
    print(tv);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          title:
      const Customtext(
        color: Colors.white,
        text: 'Movies',
        size: 15,)
      ),
      body:ListView(
        children: [
          TopratedPage(toprated: topratedmovies,),//using this mwthods from classes
          TrendingMv( trending: trendmv,),
          TvPage(tv:tv),
        ],
      ) ,
    );
  }
}
