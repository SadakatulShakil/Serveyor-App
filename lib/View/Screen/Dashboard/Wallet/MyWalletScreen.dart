import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/TransactionsList.dart';
import 'Widgets/WalletCard.dart';

class MyWalletScreen extends StatefulWidget {
  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16),
              WalletCard(
                balance: 7409332,
                name: "Angga Risky",
                cardNumber: "2208 1996 4900",
              ),
              SizedBox(height: 24),
              _buildLatestTransactions(),
              Expanded(
                child: TransactionsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Wallet',
          style: GoogleFonts.mulish(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.download),
      ],
    );
  }

  Widget _buildLatestTransactions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Latest Transactions',
          style: GoogleFonts.mulish(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            // Handle view all
          },
          child: Text('View All', style: GoogleFonts.mulish(),),
        ),
      ],
    );
  }
}