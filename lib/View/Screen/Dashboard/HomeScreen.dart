import 'package:flutter/material.dart';
import 'package:serveyor_app/View/Screen/Dashboard/Profile/ProfileScreen.dart';
import 'package:serveyor_app/View/Screen/PendingRequest/PendingRequestScreen.dart';
import 'package:serveyor_app/View/Screen/SurveyDetails/SurveyDetailsScreen.dart';
import 'package:serveyor_app/View/Screen/SurveyHistory/SurveyHistoryScreen.dart';
import 'package:serveyor_app/View/Screen/SurveyPages/MapDirectionScreen.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Example state variables
  String userName = 'Mahim Sikdar';
  double userRating = 4.8;
  int totalEarning = 10000;
  int totalSurvey = 50;
  String timeOnline = '15h 30m';
  String status = 'Online';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue background with curved bottom
          Container(
            height: MediaQuery.of(context).size.height * 0.57, // Adjust as needed
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          // White background for bottom half
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6, // Adjust as needed
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildIncomingRequestCard(),
                  SizedBox(height: 8,),
                  _buildBottomButtons(),
                ],
              ),
            ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                _buildProfileSection(),
                _buildStatsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfileScreen(true)),
              );
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/mahim.png'),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: GoogleFonts.mulish(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Text(
                    userRating.toString(),
                    style: GoogleFonts.mulish(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Earning',
            style: GoogleFonts.mulish(color: Colors.white70, fontSize: 16),
          ),
          Text(
            '$totalEarning BDT',
            style: GoogleFonts.mulish(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('Total Survey', totalSurvey.toString()),
              _buildStatItem('Time Online', timeOnline),
              _buildStatItem('Status', status, isStatus: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, {bool isStatus = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.mulish(color: Colors.white70, fontSize: 14)),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.mulish(
            color: isStatus ? Colors.greenAccent : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildIncomingRequestCard() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Incoming Request', style: GoogleFonts.mulish(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/mohsin.png'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mohsin Kalam', style: GoogleFonts.mulish(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('3 kms away | 20 mins', style: GoogleFonts.mulish(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.yellow, size: 18),
                Text('4.8', style: GoogleFonts.mulish(fontSize: 16)),
              ],
            ),
            SizedBox(height: 12),
            Text('Location', style: GoogleFonts.mulish(color: Colors.grey)),
            Text('Bijoy Sharani, Dahaka', style: GoogleFonts.mulish(fontSize: 16)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _handleAccept,
                    child: Text('Accept', style: GoogleFonts.mulish(color: Colors.white),),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _handleDetails,
                    child: Text('Details', style: GoogleFonts.mulish(),),
                    style: OutlinedButton.styleFrom(primary: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIconButton(Icons.history, 'Pending Request', _handlePendingRequest),
        _buildIconButton(Icons.list_alt, 'Survey History', _handleSurveyHistory),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.height / 5,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.blue, size: 50),
          ),
          SizedBox(height: 8),
          Text(label, style: GoogleFonts.mulish(color: Colors.blue)),
        ],
      ),
    );
  }

  // Example methods to handle user interactions
  void _handleAccept() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MapDirectionScreen()),
    );
  }

  void _handleDetails() {
    // Implement details logic
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SurveyDetailsScreen(true)),
    );
  }

  void _handlePendingRequest() {
    // Implement pending request logic
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PendingRequestScreen()),
    );
  }

  void _handleSurveyHistory() {
    // Implement survey history logic
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SurveyHistoryScreen()),
    );
  }
}