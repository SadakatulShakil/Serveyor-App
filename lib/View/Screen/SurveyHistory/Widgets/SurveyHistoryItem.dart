import 'package:flutter/material.dart';

import '../Models/SurveyHistoryModel.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyHistoryItem extends StatelessWidget {
  final SurveyHistory request;
  final VoidCallback onPressed;

  const SurveyHistoryItem({
        Key? key,
        required this.request,
        required this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(request.imageUrl),
      ),
      title: Text(request.name, style: GoogleFonts.mulish()),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location: '+request.location, style: GoogleFonts.mulish()),
          Text('Settlement: '+request.claimType, style: GoogleFonts.mulish(fontWeight: FontWeight.w600),),
        ],
      ),
      trailing: Column(
        children: [
          Text(request.status, style: GoogleFonts.mulish(fontSize: 14, color: Colors.green),),
          Text('Time: '+_formatTime(request.time), style: GoogleFonts.mulish(),),
        ],
      ),
      onTap: onPressed,
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}