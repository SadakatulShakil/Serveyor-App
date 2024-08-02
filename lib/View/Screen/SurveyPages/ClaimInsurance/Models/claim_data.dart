import 'package:flutter/material.dart';
import 'dart:io';

class ClaimData {
  String policyInformation;
  String location;
  DateTime accidentDate;
  TimeOfDay accidentTime;
  String description;
  String ownerName;
  String driverName;
  String drivingLicence;
  List<File> images;

  ClaimData({
    this.policyInformation = 'M8000000007',
    this.location = 'Bijoy Sarani, Dhaka',
    DateTime? accidentDate,
    TimeOfDay? accidentTime,
    this.description = '',
    this.ownerName = '',
    this.driverName = '',
    this.drivingLicence = '',
    List<File>? images,
  }) :
        this.accidentDate = accidentDate ?? DateTime.now(),
        this.accidentTime = accidentTime ?? TimeOfDay.now(),
        this.images = images ?? [];
}