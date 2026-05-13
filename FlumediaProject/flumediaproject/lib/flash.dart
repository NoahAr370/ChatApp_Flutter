import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flumediaproject/pages/provider/UtilProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:go_router/go_router.dart';
//import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FlashPage extends StatelessWidget {
  FlashPage({super.key});

  final gradientcolor = [
    Color(0xff8f00ff), // violet
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];
  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  final colorizeTextStyle = GoogleFonts.padauk(fontSize: 30);
  // bool showtitle = false;

  // _changedpage() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   context.go("/login");
  // }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Utilprovider pVider = Provider.of<Utilprovider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg3.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  "assets/images/rm.jpg",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              !pVider.showTitle
                  ? AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'စစ်မှန်မူ',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'အောင်မြင်မှု',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'ဖလားသိမ်းမှု',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onFinished: () async {
                        bool bol = await pVider.checkAppVersion();

                        if (bol) {
                          print("App is Uptodate");
                          await Future.delayed(Duration(seconds: 5));
                          context.go("/logic");
                          //context.go("/home");
                          //    setState(() {
                          //   showtitle = true;
                          //  _changedpage();
                          // });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("App Version Outdated!"),
                                  content: Column(
                                    children: [
                                      Text("Your app version is outdated!"),
                                      Text("Please download new version!"),
                                      Text(pVider.error)
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          exit(0);
                                        },
                                        child: Text("Exit")),
                                    TextButton(
                                        onPressed: () {
                                          _launchUrl(pVider.error);
                                        },
                                        child: Text("Download"))
                                  ],
                                );
                              });
                          // print(pVider.error);
                          // print("Need to update Application");
                        }
                      },
                    )
                  : GradientAnimationText(
                      text: Text('People Media',
                          style: GoogleFonts.caramel(fontSize: 80)),
                      colors: gradientcolor,
                      duration: Duration(seconds: 5),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
