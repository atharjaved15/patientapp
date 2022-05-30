import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Colors/colors.dart';
import 'package:patientapp/Views/Login/login_mobile.dart';

import '../Login/login_main.dart';

class getstarted_mobile extends StatelessWidget {
  const getstarted_mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                  items: [
                    Image.asset('images/doc.jpg'),
                    Image.asset('images/doc1.jpg'),
                    Image.asset('images/doc2.jpg'),
                  ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('This app is made to provide online medical treatment facilities by getting appoinment from doctors by using this application.' , textAlign: TextAlign.center , style: TextStyle(color: secondary_color,fontStyle: FontStyle.italic, ),),
              ),
              Container(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login_main()));

                    },
                  color: main_color,
                  child: const Center(child: Text('Get Started' , style: TextStyle(color: Colors.white ),),),
                    ),
              )
            ],
          ),
        )

      ),
    );
  }
}
