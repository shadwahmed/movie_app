import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/presentation/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  static const String routeName = "splash screen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),
            () => Navigator.pushNamed(context, HomeScreen.routeName));
    return Scaffold(
      body: Container(
        color: Color(0xff000000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 230),
            child: Image.asset("assets/images/andriod12splash.png",
              width: 350,
              height: 350,
            ),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 70),
                alignment: Alignment.center,
                child: Image.asset("assets/images/route.png",
                  width: 139,
                  height: 139,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 175),
                alignment: Alignment.center,
                child: Text(
                  "Supervised by Mohamed Nabil",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFBB3B),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

