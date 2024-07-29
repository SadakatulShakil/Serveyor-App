import 'package:flutter/material.dart';

class ClaimData {
  String policyInformation;
  String location;
  DateTime accidentDate;
  TimeOfDay accidentTime;
  String description;
  String? name;
  String? email;
  String? phone;

  ClaimData({
    this.policyInformation = 'M8000000007',
    this.location = 'Bijoy Sarani, Dhaka',
    DateTime? accidentDate,
    TimeOfDay? accidentTime,
    this.description = '',
    this.name,
    this.email,
    this.phone,
  }) :
        this.accidentDate = accidentDate ?? DateTime.now(),
        this.accidentTime = accidentTime ?? TimeOfDay.now();
}