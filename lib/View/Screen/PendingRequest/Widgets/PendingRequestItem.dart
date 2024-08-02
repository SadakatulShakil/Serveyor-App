import 'package:flutter/material.dart';

import '../Models/PendingRequestModel.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingRequestItem extends StatelessWidget {
  final PendingRequest request;
  final VoidCallback onPressed;

  const PendingRequestItem({
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(request.name, style: GoogleFonts.mulish()),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location: '+request.location, style: GoogleFonts.mulish()),
          Text('Vehicle: '+request.vehicle, style: GoogleFonts.mulish()),
        ],
      ),
      trailing: Text('Time: '+_formatTime(request.time), style: GoogleFonts.mulish()),
      onTap: onPressed,
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}