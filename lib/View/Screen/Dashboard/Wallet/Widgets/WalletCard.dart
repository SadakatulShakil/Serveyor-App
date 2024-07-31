import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCard extends StatelessWidget {
  final double balance;
  final String name;
  final String cardNumber;

  const WalletCard({
    Key? key,
    required this.balance,
    required this.name,
    required this.cardNumber,
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
          Text(
            '\$${balance.toStringAsFixed(0)}',
            style: GoogleFonts.mulish(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: GoogleFonts.mulish(color: Colors.white),
              ),
              Icon(Icons.wallet, color: Colors.white),
            ],
          ),
          SizedBox(height: 8),
          Text(
            cardNumber,
            style: GoogleFonts.mulish(color: Colors.white),
          ),
        ],
      ),
    );
  }
}