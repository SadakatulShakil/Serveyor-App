import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serveyor_app/View/Screen/Dashboard/DashBoardScreen.dart';
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
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    bool isLogged = prefs.getBool('iFirstTime') ?? true;

    //print('bool: $isLogged ------ $isFirstTime');

    if (isFirstTime) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardScreen()),
      );
    }else if (!isLogged) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashBoardScreen()),
        );
      }else{
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Logo(),
            ),
          ),
          BottomTexts(),
        ],
      )
    );

  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/splash.png', height: 150,)
    );
  }
}

class BottomTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Surveyor',
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
    );
  }
}
