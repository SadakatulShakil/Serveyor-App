import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  bool isBackButton;
  ProfileScreen(this.isBackButton);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.pinkAccent,
              height: 300,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile_image.png'),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3057',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '274',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '52',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'Collection',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'laukeith94@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '+82 95 5808 2654',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'www.laukeith.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
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