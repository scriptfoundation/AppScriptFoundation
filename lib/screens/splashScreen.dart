import 'dart:async';

import 'package:ScriptFoundation/screens/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var _alignment = Alignment.bottomCenter;

  @override
  initState() {
    super.initState();
    Timer(Duration(milliseconds: 10), animate);
    Future.delayed(Duration(seconds: 5),(){
      navigate();
    });
  }

  navigate() {
    Navigator.of(context)
        .pushReplacement(CupertinoPageRoute(builder: (_) => HomeScreen()));
  }

  animate() {
    setState(() {
      _alignment = Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/bg.jpg'),
      )),
      child: Stack(
        children: <Widget>[
          Center(
            child: FadeInImage(
              placeholder: AssetImage('assets/images/bg.jpg'),
              image: AssetImage(
                'assets/images/logo-script.png',
              ),
              height: double.infinity,
              width: double.infinity,
              fadeInDuration: Duration(milliseconds: 300),
              fit: BoxFit.cover,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            alignment: _alignment,
          ),
        ],
      ),
    );
  }
}
