import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serveyor_app/View/Screen/Login/LoginScreen.dart';
import 'package:serveyor_app/View/Screen/Splash/OnBoardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utill/color_resources.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _doSessionTask ()async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('iFirstTime') ?? true;

    if (isFirstTime) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }

  }

  @override
  void initState() {
    super.initState();
    _doSessionTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFADD8E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 150,),
            Text(
              'Surveyor App',
              style: GoogleFonts.mulish(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              'A platform built for a new way of working',
              style: GoogleFonts.mulish(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
          ],
        ),
      )
    );

  }


}
