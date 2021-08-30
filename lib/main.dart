import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mskola/presenatation/Onboard/getStarted.dart';
import 'package:mskola/presenatation/Splash/Splash.dart';
import 'package:mskola/presenatation/dashboard/Dashboard.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MsKola',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/signUp':(BuildContext context) => GetStarted(),
        '/home':(BuildContext context) => Dashboard(),

      },
    );
  }
}
