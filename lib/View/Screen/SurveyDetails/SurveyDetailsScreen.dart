import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SurveyPages/MapDirectionScreen.dart';
import 'Widgets/VehicleCard.dart';

class SurveyDetailsScreen extends StatefulWidget {
  bool isAcceptButton;
  SurveyDetailsScreen(this.isAcceptButton);
  @override
  _SurveyDetailsScreenState createState() => _SurveyDetailsScreenState();
}

class _SurveyDetailsScreenState extends State<SurveyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Details", style: GoogleFonts.mulish())),
      floatingActionButton: Visibility(
        visible: widget.isAcceptButton ? true : false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MapDirectionScreen()),
                );
              },
              backgroundColor: Colors.blue,
              label: Container(
                width: MediaQuery.of(context).size.width,
                  child: Center(child: Text('Accept', style: GoogleFonts.mulish(color: Colors.white),))),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              VehicleCard(
                imageUrl: 'assets/images/vehicle.png',
                ownerName: "Owner Name: Mohsin Kalam",
                vehicle: 'BMW X1'
              ),
              SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildOtherInformation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other Information:',
          style: GoogleFonts.mulish(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0,),
        _buildInformationItem('Policy ID:', 'IN-94898878', Colors.black),
        Visibility(
          visible: widget.isAcceptButton ? false : true,
            child: _buildInformationItem('Status:', 'Completed', Colors.green)),
        Visibility(
            visible: widget.isAcceptButton ? false : true,
            child: _buildInformationItem('Settlement:', 'Instant Cash', Colors.green)),

        _buildInformationItem('Email:', 'owneremail@gmail.com', Colors.black),
        _buildInformationItem('Contact:', '01751330394', Colors.black),
        _buildInformationItem('Driver Name:', 'MD. Abu Tasif', Colors.black),
        _buildInformationItem('Driver Phone:', '01717345963', Colors.black),
        _buildInformationItem('Location:', 'Bijoy Sharani, Dhaka', Colors.black),
        _buildInformationItem('Date & Time:', '7 August 2024, 6:18 PM', Colors.black),
        SizedBox(height: 40.0,),
      ],
    );
  }
  Widget _buildInformationItem(String label, String value, Color colorCode) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.mulish(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(value, style: GoogleFonts.mulish(
              fontWeight: FontWeight.w500,
              color: colorCode)),
        ],
      ),
    );
  }
}