import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ClaimInsurance/ClaimInsuranceScreen.dart';

class MapDirectionScreen extends StatefulWidget {
  const MapDirectionScreen({Key? key}) : super(key: key);

  @override
  _MapDirectionScreenState createState() => _MapDirectionScreenState();
}

class _MapDirectionScreenState extends State<MapDirectionScreen> {
  String backgroundImage = 'assets/images/initial_image.jpeg';
  String buttonText = 'Continue';

  void _onButtonPressed() {
    if (buttonText == 'Investigate vehicle') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ClaimInsuranceForm()),
      );
    }
    setState(() {
      buttonText = 'Processing...';
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        backgroundImage = 'assets/images/new_image.jpeg';
        buttonText = 'Investigate vehicle';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              child: Text(buttonText, style: GoogleFonts.mulish(color: Colors.white),),
              onPressed: () {
                _onButtonPressed();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}