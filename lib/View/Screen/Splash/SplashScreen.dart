import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utill/color_resources.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Future<void> _doSessionTask ()async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   String expiryTime = prefs.getString('session_expiry')??'';
  //   print('cccccccccc: '+ expiryTime);
  //   if(expiryTime != ''){
  //     final expirationTime = DateTime.parse(expiryTime);
  //     final currentTime = DateTime.now();
  //     if(currentTime.isAfter(expirationTime)){
  //       prefs.setString('tokenId', '');
  //       prefs.setString('session_expiry', '');
  //       await Future.delayed(const Duration(seconds: 2));
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => LoginScreen()),
  //       );
  //     }else{
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => DashBoardScreen()),
  //       );
  //     }
  //   }else{
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //     );
  //   }
  //
  // }

  @override
  void initState() {
    super.initState();
    //_doSessionTask();
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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              'A platform built for a new way of working',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
          ],
        ),
      )
    );

  }


}
