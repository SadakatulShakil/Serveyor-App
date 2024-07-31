import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final Duration? duration;
  final IconData icon;
  final Color color;

  const TransactionItem({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    this.duration,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
                ),
                if (duration != null)
                  Text(
                    '${duration!.inHours} hours',
                    style: GoogleFonts.mulish(color: Colors.grey),
                  ),
                Text(
                  '\$${amount.toStringAsFixed(0)}',
                  style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${date.day} ${_getMonth(date.month)} ${date.year}',
                  style: GoogleFonts.mulish(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getMonth(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}