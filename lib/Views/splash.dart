import 'package:flutter/material.dart';
import 'package:patientapp/Colors/colors.dart';
import 'package:patientapp/Views/GetStarted/getstarted_main.dart';
import 'package:patientapp/Views/GetStarted/getstarted_mobile.dart';
import 'package:splashscreen/splashscreen.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        backgroundColor: Colors.white,
        seconds: 3,
        image: Image.asset('images/logo.png'),
        loadingText: Text("Loading" , style: TextStyle(color: main_color),),
        photoSize: 100,
        loaderColor: main_color,
        navigateAfterSeconds: const getstarted_main(),
      ),
    );
  }
}

