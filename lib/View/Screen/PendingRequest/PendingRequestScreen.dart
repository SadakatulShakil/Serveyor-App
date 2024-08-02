import 'package:flutter/material.dart';

import '../SurveyDetails/SurveyDetailsScreen.dart';
import 'Models/PendingRequestModel.dart';
import 'Widgets/PendingRequestItem.dart';
import 'package:google_fonts/google_fonts.dart';


class PendingRequestScreen extends StatefulWidget {
  const PendingRequestScreen({Key? key}) : super(key: key);

  @override
  _PendingRequestHistoryScreenState createState() => _PendingRequestHistoryScreenState();
}

class _PendingRequestHistoryScreenState extends State<PendingRequestScreen> {
  final List<PendingRequest> requests = [
    PendingRequest(
      name: "John Doe",
      location: "New York, USA",
      vehicle: "BMW x-version",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: "assets/images/mahim.png",
    ),
    PendingRequest(
      name: "Jane Smith",
      location: "London, UK",
      vehicle: "Toyota corolla",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: "assets/images/mohsin.png",
    ),
    PendingRequest(
      name: "John Doe",
      location: "New York, USA",
      vehicle: "Nisan Double-xl",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: "assets/images/mahim.png",
    ),
    PendingRequest(
      name: "Jane Smith",
      location: "London, UK",
      vehicle: "Jaguar latest",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: "assets/images/mohsin.png",
    ),
    PendingRequest(
      name: "John Doe",
      location: "New York, USA",
      vehicle: "Nisan Double-xl",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: "assets/images/mahim.png",
    ),
    PendingRequest(
      name: "Jane Smith",
      location: "London, UK",
      vehicle: "Jaguar latest",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: "assets/images/mohsin.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pending Request", style: GoogleFonts.mulish())),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) => Container(
            color: index.isEven ? Colors.grey[200] : Colors.white, // Alternate colors
            child: PendingRequestItem(
                request: requests[index],
                onPressed: () => _showDetails(context, requests[index])
            )
        ),
      ),
    );
  }
}

void _showDetails(BuildContext context, PendingRequest request) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => SurveyDetailsScreen(true)),
  );
}