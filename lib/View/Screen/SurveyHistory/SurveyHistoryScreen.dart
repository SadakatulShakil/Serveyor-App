import 'package:flutter/material.dart';

import '../SurveyDetails/SurveyDetailsScreen.dart';
import 'Models/SurveyHistoryModel.dart';
import 'Widgets/SurveyHistoryItem.dart';
import 'package:google_fonts/google_fonts.dart';


class SurveyHistoryScreen extends StatefulWidget {
  const SurveyHistoryScreen({Key? key}) : super(key: key);

  @override
  _SurveyHistoryScreenState createState() => _SurveyHistoryScreenState();
}

class _SurveyHistoryScreenState extends State<SurveyHistoryScreen> {
  final List<SurveyHistory> requests = [
    SurveyHistory(
      name: "John Doe",
      location: "New York, USA",
      vehicle: "BMW x-version",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: "assets/images/mahim.png",
      status: 'Completed',
      claimType: 'Cashless',
    ),
    SurveyHistory(
      name: "Jane Smith",
      location: "London, UK",
      vehicle: "Toyota corolla",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: "assets/images/mohsin.png",
      status: 'Completed',
      claimType: 'Instant Pay',
    ),
    SurveyHistory(
      name: "John Doe",
      location: "New York, USA",
      vehicle: "Nisan Double-xl",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: "assets/images/mahim.png",
      status: 'Completed',
      claimType: 'Cashless',
    ),
    SurveyHistory(
      name: "Jane Smith",
      location: "London, UK",
      vehicle: "Jaguar latest",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: "assets/images/mohsin.png",
      status: 'Completed',
      claimType: 'Instant Pay',
    ),
    SurveyHistory(
      name: "John Doe",
      location: "New York, USA",
      vehicle: "Nisan Double-xl",
      time: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: "assets/images/mahim.png",
      status: 'Completed',
      claimType: 'Instant Pay',
    ),
    SurveyHistory(
      name: "Jane Smith",
      location: "London, UK",
      vehicle: "Jaguar latest",
      time: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: "assets/images/mohsin.png",
      status: 'Completed',
      claimType: 'Cashless',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Survey History", style: GoogleFonts.mulish(),)),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) => Container(
            color: index.isEven ? Colors.grey[200] : Colors.white, // Alternate colors
            child: SurveyHistoryItem(
                request: requests[index],
                onPressed: () => _showDetails(context, requests[index]),
            )
        ),
      ),
    );
  }
}

void _showDetails(BuildContext context, SurveyHistory request, ) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => SurveyDetailsScreen(false)),
  );
}