import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'homepage.dart';



void main()  {
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget page = SplashScreenView(
      navigateRoute:  HomePage(),
      duration: 7000,
      imageSize: 130,
      imageSrc: "assets/images/img.png",
      backgroundColor: const Color(0XFF191826),
    );

    return MaterialApp (
      debugShowCheckedModeBanner: false,
      title: '',
      home: page,
    );

  }
}
