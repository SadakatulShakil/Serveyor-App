import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
      body: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Column(
            children: [
              _buildProfileSection(),
              _buildStatsSection(),
              _buildIncomingRequestCard(),
              _buildBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 18),
                  Text(
                    userRating.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Earning',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            '$totalEarning BDT',
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
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
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isStatus ? Colors.greenAccent : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildIncomingRequestCard() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Incoming Request', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/mohsin_image.jpg'),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mohsin Kalam', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('3 kms away | 20 mins', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.yellow, size: 18),
              Text('4.8', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 12),
          Text('Location', style: TextStyle(color: Colors.grey)),
          Text('Bijoy Sharani, Dahaka', style: TextStyle(fontSize: 16)),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _handleAccept,
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: _handleDetails,
                  child: Text('Details'),
                  style: OutlinedButton.styleFrom(primary: Colors.blue),
                ),
              ),
            ],
          ),
        ],
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
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // Example methods to handle user interactions
  void _handleAccept() {
    // Implement accept logic
    setState(() {
      totalSurvey++;
    });
  }

  void _handleDetails() {
    // Implement details logic
  }

  void _handlePendingRequest() {
    // Implement pending request logic
  }

  void _handleSurveyHistory() {
    // Implement survey history logic
  }
}