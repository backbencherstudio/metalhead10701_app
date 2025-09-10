class JobModel{
  final String id;
  final String name;
  final String type;
  final String urgency;
  final String bargainStatus;
  final DateTime startTime;
  final DateTime endTime;
  final double price;
  final String location;

  const JobModel({
    required this.id,
    required this.name,
    required this.type,
    required this.urgency,
    required this.bargainStatus,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.location,
});
}