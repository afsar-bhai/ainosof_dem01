import 'dart:async';

import 'package:ainosof_demo/ui/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color customColor = Color.fromRGBO(19, 1, 57, 1.0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
// After 3 seconds, navigate to the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WelcomeScreen()), // Replace MyApp() with your main screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:customColor ,
      body: Container(
        //color: Colors.white,
    //     decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: [
    //     Colors.blue,
    //      Colors.white,
    //       Colors.blue
    //       //Colors.blueAccent,
    //     // Color.fromRGBO(19, 1, 57, 0),
    //     ],
    //       //stops: [0.0, 0.5, 1.0],
    // ),
    //     ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(

              child: Image.asset(
                'assets/white-logo.png',
                height: 200,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Thynk',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 5,
            ),
            Text('Unlimited',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 15,
            ),
            Text('Wait For Second...',style: TextStyle(color: Colors.white,fontSize: 20,),),
            const SizedBox(
              height: 15,
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.refresh,size: 40,),color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
