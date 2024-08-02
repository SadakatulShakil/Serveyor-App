class PendingRequest {
  final String name;
  final String location;
  final String vehicle;
  final DateTime time;
  final String imageUrl;

  const PendingRequest({
    required this.name,
    required this.location,
    required this.vehicle,
    required this.time,
    required this.imageUrl,
  });
}