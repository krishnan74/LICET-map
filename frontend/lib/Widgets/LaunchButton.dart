import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchButton extends StatelessWidget {
  const LaunchButton({Key? key, required this.navigateTo, required this.buttonText});

  final String navigateTo;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 61, 64, 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromRGBO(61, 61, 64, 1),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigateTo);
        },
        child: Text(
          buttonText,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
