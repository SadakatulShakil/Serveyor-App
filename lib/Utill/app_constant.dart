import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = 'https://dca-api.appswind.com/v1/';
  static const String loginUrl = '${baseUrl}auth/login';
  static const String registerUrl = '${baseUrl}auth/register';
  static const String logOutUrl = '${baseUrl}auth/logout';
  static const String profileData = '${baseUrl}auth/profile';
  static const String updateProfileData = '${baseUrl}auth/profile';
  static const String referralData = '${baseUrl}auth/referral';
  static const String jobSectorsData = '${baseUrl}auth/job-sectors';
  static const String acSectorsData = '${baseUrl}auth/academic-groups';
  static const String updatePassword = '${baseUrl}auth/change-password';
  static const String sliderData = '${baseUrl}slider';
  static const String eventsData = '${baseUrl}events';
  static const String newsData = '${baseUrl}news';
  static const String members = '${baseUrl}members';
  static const String aboutUs = '${baseUrl}settings';
  static const String approvalApplications = '${baseUrl}approval/request';
  static const String updateApprovalApplications = '${baseUrl}approval';
  static const String notificationData = '${baseUrl}notifications';
  static const String sendPushNotification = 'https://fcm.googleapis.com/fcm/send';
  //App colors
  static const Color chwColor =  Color(0xffD35520) ;

  static const Color rrtColor =  Color(0xff16A085) ;
  static const Color outreachColor =  Color(0xff32475B) ;
}