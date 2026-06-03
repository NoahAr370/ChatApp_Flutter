import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:google_fonts/google_fonts.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final gradientcolor = [
    Color(0xff8f00ff), // violet
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg1.jpg"), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
                child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Image.asset(
                      "assets/images/sqlogo.jpg",
                      fit: BoxFit.cover,
                    ))),
            SizedBox(
              height: 10,
            ),
            FadeInUp(
              child: GradientAnimationText(
                  text: Text(
                    "Rivalry Eports",
                    style: GoogleFonts.aBeeZee(fontSize: 50),
                  ),
                  colors: gradientcolor,
                  duration: Duration(seconds: 5)),
            )
          ],
        ),
      ),
    ));
  }
}
