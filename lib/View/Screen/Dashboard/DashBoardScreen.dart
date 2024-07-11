import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0788A3),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 150,),
              Text(
                'Surveyor App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 40),
            ],
          ),
        )
    );

  }


}
