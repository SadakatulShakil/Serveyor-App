import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleCard extends StatelessWidget {
  final String imageUrl;
  final String ownerName;
  final String vehicle;

  const VehicleCard({
    Key? key,
    required this.imageUrl,
    required this.ownerName,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E1E99),  // Dark blue
            Color(0xFF7878FA),  // Light purple
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ownerName,
                    style: GoogleFonts.mulish(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    vehicle,
                    style: GoogleFonts.mulish(color: Colors.white),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/mohsin.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}