import 'package:flutter/material.dart';
import './Widgets/LaunchButton.dart';
import 'package:google_fonts/google_fonts.dart';

class Launcher_Page extends StatefulWidget {
  Launcher_Page({super.key});

  @override
  State<Launcher_Page> createState()=> _Launcher_Page();
}

class _Launcher_Page extends State<Launcher_Page>{
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 40, 43, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LICET - MAP",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Color.fromRGBO(198,202,237, 1), letterSpacing: .5, fontSize: 30, fontWeight: FontWeight.bold),
              ),

            ),

            SizedBox(height: 30),

            LaunchButton(
              navigateTo: "/known",
              buttonText: "You know where you are located...",
            ),

            SizedBox(height: 30),

            LaunchButton(
              navigateTo: "/unknown",
              buttonText: "You don't know where you are located...",
            ),
          ],
        ),
      ),
    );
  }

}