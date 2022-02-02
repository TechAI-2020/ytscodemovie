import 'package:codemovie/decorationspage/textdec.dart';
import 'package:flutter/material.dart';

import 'descriptionpage.dart';

class TvPage extends StatelessWidget {
  const TvPage({Key? key, required this.tv}) : super(key: key);
  final List tv;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Customtext(
            text: 'TV Shows ',
            color: Colors.green,
            size: 26,),
          const SizedBox(height:10 ,),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount:tv.length ,
              scrollDirection: Axis.horizontal ,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){

                  },//inkwell help when you click image it direct you to the image description
                  child:
                  tv[index]['backdrop_path']!=null?Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height:140,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+ tv[index]['backdrop_path'],//image url from api
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5 ,),
                          Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Customtext(
                                  size: 15,
                                  text: tv[index]['original_name'] ?? 'loading' ,
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
