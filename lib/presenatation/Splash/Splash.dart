
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mskola/constraints/Color.dart';
import 'package:mskola/presenatation/Onboard/OnBoard.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  late bool _large;
  late bool _medium;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnBoard()),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(bottom: 10.0),child:new Text('from', style: TextStyle(color: Colors.white,fontSize: 14),)),
              Padding(padding: EdgeInsets.only(bottom: 30.0),child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // new Image.asset('assets/image/icon.png', height: 20,width: 20,),
                  new RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(text: 'MountedWings', style: TextStyle(color: Colors.white, fontSize: 20)),


                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                ],
              )),


            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
              new Text('mSKOLA', style: TextStyle(fontSize: 72,fontWeight: FontWeight.w500,color: primaryColor,fontFamily: 'Roboto' ),)
            ],
          ),
        ],
      ),
    );
  }
}