import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serveyor_app/View/Screen/Dashboard/Profile/SettingsScreen.dart';

class ProfileScreen extends StatefulWidget {
  bool isBackButton;
  ProfileScreen(this.isBackButton);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Example state variables
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomLeft,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/mahim.png',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.blueAccent.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.isBackButton)
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              Positioned(
                left: 20,
                bottom: 10,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/mahim.png'),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 10,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AccountSettingsPage()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.blue,
                      ),
                      Text("Settings", style: GoogleFonts.mulish(color: Colors.blue),)
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('51', 'Total Survey'),
                _buildStatColumn('4.5', 'Rating'),
                _buildStatColumn('5200 BDT', 'Earning'),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildScrollableInfoRows(),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: GoogleFonts.mulish(color: Colors.grey)),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[300], size: 20),
          SizedBox(width: 10),
          Text(label, style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.w700)),
          SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(text, style: GoogleFonts.mulish(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableInfoRows() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: [
          _buildInfoRow(Icons.account_circle_rounded, 'Name: ', 'Md. Mahim Chawdhury'),
          _buildInfoRow(Icons.email, 'Email: ', 'laukeith94@gmail.com'),
          _buildInfoRow(Icons.phone, 'Contact: ', '+82 95 5808 2654'),
          _buildInfoRow(Icons.date_range, 'Born: ', '10-05-1996'),
          _buildInfoRow(Icons.male_outlined, 'Gender: ','Male'),
          _buildInfoRow(Icons.home, 'Address: ','Nabisco, Tejgong, Dhaka'),
          _buildInfoRow(Icons.language, 'Language: ','Bangla & English'),
          SizedBox(height: 55,)
          // Add more info rows as needed
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}