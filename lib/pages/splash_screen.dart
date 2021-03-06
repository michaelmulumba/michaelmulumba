import 'dart:async';

import 'package:flutter/material.dart';

import 'introduction_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   bool _isVisible = false;

  _SplashScreenState(){

    Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const IntroductionPage()), (route) => false);
      });
    });

    new Timer(
      Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true;
        });
    }

    );

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0: 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
          height: 140.0,
          width: 140.0,
          child: ClipOval(
            child: Icon(Icons.recycling_outlined, size: 128,),
          )
          )
        ),

      ),
    );
  }
}