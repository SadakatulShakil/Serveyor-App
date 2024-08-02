class SurveyHistory{
  final String name;
  final String location;
  final String vehicle;
  final String status;
  final String claimType;
  final DateTime time;
  final String imageUrl;

  const SurveyHistory({
    required this.name,
    required this.location,
    required this.vehicle,
    required this.status,
    required this.claimType,
    required this.time,
    required this.imageUrl,
  });
}