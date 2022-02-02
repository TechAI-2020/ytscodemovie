import 'package:codemovie/decorationspage/textdec.dart';
import 'package:flutter/material.dart';

import 'descriptionpage.dart';

class TrendingMv extends StatelessWidget {
  const TrendingMv({Key? key, required this.trending}) : super(key: key);
final List trending;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Customtext(
            text: 'Trending Movies',
            color: Colors.green,
            size: 26,),
          const SizedBox(height:10 ,),
          SizedBox(
            height:290,
            child: ListView.builder(
              itemCount:trending.length ,
                scrollDirection: Axis.horizontal ,
                itemBuilder: (context,index){
                 return InkWell(
                   onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage(
                    launch_on: trending[index]['release_date'],
                    description: trending[index]['overview'],
                    name: trending[index]['title'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['backdrop_path'],
                    vote: trending[index]['vote_average'].toString(),
                    posterurl:   'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path'],
                  ))) ;
                   },//inkwell help when you click image it direct you to the image description
                   child:
                   trending[index]['title']!=null?Container(
                     width: 140,
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path'],//image url from api

                                ),
                              ),
                            ),
                          ),
                           const SizedBox(height: 5,),
                           Column(
                             crossAxisAlignment:CrossAxisAlignment.start ,
                             children: [
                               Customtext(
                               size: 15,
                               text: trending[index]['title'] ?? 'loading' ,
                               color: Colors.white,),

                               const Customtext(text: 'release date:', color: Colors.green, size: 10),
                               Customtext(
                                 size: 13,
                                 text: trending[index]['release_date'] ?? 'upcoming' ,
                                 color: Colors.white,),
                           ]),
                         ],
                       ),
                     ),
                   ):Container(),
                 );
                },
            ),
          ),
        ],
      ),
    );
  }
}
