import 'package:codemovie/decorationspage/textdec.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key, required this.name, required this.vote, required this.description, required this.launch_on, required this.bannerurl, required this.posterurl}) : super(key: key);
   final String name,vote,description,launch_on,bannerurl,posterurl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(
                    bottom: 8,
                      child:  Customtext(
                    text: ' Average Rating - '+vote,
                    size: 20,
                    color: Colors.white,

                  )),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(10),
              child: Customtext(
                color: Colors.white,
                size: 15,
                text: name ,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Customtext(
                    text: 'Releasing on - ',
                    size: 15,
                    color: Colors.green ,),
                  Customtext(
                    text: launch_on,
                    size: 14,
                    color: Colors.white ,),

                ],
              ) ,
            ),
            Row(

              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Customtext(
                      size: 15,
                      text: description,
                      color: Colors.white,

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
