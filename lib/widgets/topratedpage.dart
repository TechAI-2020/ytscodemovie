import 'package:codemovie/decorationspage/textdec.dart';
import 'package:flutter/material.dart';

import 'descriptionpage.dart';

class TopratedPage extends StatelessWidget {
  const TopratedPage({Key? key, required this.toprated}) : super(key: key);
  final List toprated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Customtext(
            text: 'Top Rated Movies',
            color: Colors.green,
            size: 26,),
          const SizedBox(height:10 ,),
          SizedBox(
            height:290,
            child: ListView.builder(
              itemCount:toprated.length ,
              scrollDirection: Axis.horizontal ,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage(
                      launch_on: toprated[index]['release_date'],
                      description: toprated[index]['overview'],
                      name: toprated[index]['title'],
                      bannerurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['backdrop_path'],
                      vote: toprated[index]['vote_average'].toString(),
                      posterurl:   'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path'],
                    ))) ;
                  },//inkwell help when you click image it direct you to the image description
                  child: SizedBox(
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
                                  'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path'],//image url from api

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
                                  text: toprated[index]['title'] ?? 'loading' ,
                                  color: Colors.white,),

                              ]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
