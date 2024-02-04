import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:frontend/launcher_page.dart';
import 'package:frontend/pages/KnownLocationMode.dart';
import 'package:frontend/pages/UnKnownLocationMode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: SplashScreen(),
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/known': (context) => const KnownLocation_Page(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/unknown': (context) => const UnknownLocation_Page(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context){
    return AnimatedSplashScreen(
        splash: Column(
                  children: [
                    Image.asset("assets/images/mapIcon.png", width: 200,height: 200,),
                    const Text("LICET MAP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                  ],
    ),
        nextScreen: Launcher_Page(),
        backgroundColor: Color.fromRGBO(39,40,43, 1),
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
    );
  }
}
