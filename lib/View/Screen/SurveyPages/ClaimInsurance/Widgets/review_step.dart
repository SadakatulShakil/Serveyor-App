import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/claim_data.dart';

class ReviewStep extends StatelessWidget {
  final ClaimData claimData;

  ReviewStep({required this.claimData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Review Information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildReviewItem('Policy Information', claimData.policyInformation),
          _buildReviewItem('Location', claimData.location),
          _buildReviewItem('Accident Date', DateFormat('dd MMM, yyyy').format(claimData.accidentDate)),
          _buildReviewItem('Accident Time', claimData.accidentTime.format(context)),
          _buildReviewItem('Description', claimData.description),
          _buildReviewItem('Owner Name', claimData.ownerName),
          _buildReviewItem('Driver Name', claimData.driverName),
          _buildReviewItem('Driving Licence', claimData.drivingLicence),
          SizedBox(height: 20),
          Text('Uploaded Images:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildImageList(),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildImageList() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: claimData.images.map((image) {
        return Image.file(image, width: 100, height: 100, fit: BoxFit.cover);
      }).toList(),
    );
  }
}