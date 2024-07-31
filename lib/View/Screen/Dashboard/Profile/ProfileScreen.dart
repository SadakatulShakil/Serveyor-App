import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  height: 300,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Column(
                      children: [
                        SizedBox(height: 16,),
                        Icon(
                          Icons.settings,
                          color: Colors.blue,
                        ),
                        Text("Setings", style: GoogleFonts.mulish(color: Colors.blue),)
                      ],
                    ),
                  ],
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
                _buildStatColumn('3057', 'Total Survey'),
                _buildStatColumn('4.5', 'Rating'),
                _buildStatColumn('5200 BDT', 'Earning'),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildInfoRow(Icons.email, 'laukeith94@gmail.com'),
          _buildInfoRow(Icons.phone, '+82 95 5808 2654'),
          _buildInfoRow(Icons.language, 'www.laukeith.com'),
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

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[300], size: 20),
          SizedBox(width: 10),
          Text(text, style: GoogleFonts.mulish(fontSize: 14)),
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