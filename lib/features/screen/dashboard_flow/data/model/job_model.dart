class JobModel{
  final String id;
  final String name;
  final String type;
  final String? urgency;
  final String bargainStatus;
  final DateTime startTime;
  final DateTime endTime;
  final double price;
  final String location;

  const JobModel({
    required this.id,
    required this.name,
    required this.type,
    this.urgency,
    required this.bargainStatus,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.location,
});
}



// Dummies
final List<JobModel> dummyJobs = [
  JobModel(
    id: 'job001',
    name: 'Plumbing Fix',
    type: 'Home Repair',
    //urgency: 'High',
    bargainStatus: 'Negotiable',
    startTime: DateTime(2025, 9, 10, 9, 0),
    endTime: DateTime(2025, 9, 10, 12, 0),
    price: 150.0,
    location: 'New York, NY',
  ),
  JobModel(
    id: 'job002',
    name: 'Graphic Design',
    type: 'Creative',
    //urgency: 'Medium',
    bargainStatus: 'Fixed',
    startTime: DateTime(2025, 9, 12, 10, 0),
    endTime: DateTime(2025, 9, 12, 18, 0),
    price: 300.0,
    location: 'San Francisco, CA',
  ),
  JobModel(
    id: 'job003',
    name: 'Mobile App Development',
    type: 'IT & Software',
    //urgency: 'Low',
    bargainStatus: 'Negotiable',
    startTime: DateTime(2025, 9, 15, 8, 0),
    endTime: DateTime(2025, 9, 20, 17, 0),
    price: 1200.0,
    location: 'Remote',
  ),
  JobModel(
    id: 'job004',
    name: 'Event Planning',
    type: 'Management',
    //urgency: 'High',
    bargainStatus: 'Fixed',
    startTime: DateTime(2025, 9, 25, 14, 0),
    endTime: DateTime(2025, 9, 25, 22, 0),
    price: 500.0,
    location: 'Chicago, IL',
  ),
  JobModel(
    id: 'job005',
    name: 'House Cleaning',
    type: 'Maintenance',
    //urgency: 'Medium',
    bargainStatus: 'Negotiable',
    startTime: DateTime(2025, 9, 18, 9, 0),
    endTime: DateTime(2025, 9, 18, 13, 0),
    price: 100.0,
    location: 'Austin, TX',
  ),
];

final List<JobModel> dummyUrgentJobs = [
  JobModel(
    id: 'job001',
    name: 'Plumbing Fix',
    type: 'Home Repair',
    urgency: 'High',
    bargainStatus: 'Negotiable',
    startTime: DateTime(2025, 9, 10, 9, 0),
    endTime: DateTime(2025, 9, 10, 12, 0),
    price: 150.0,
    location: 'New York, NY',
  ),
  JobModel(
    id: 'job002',
    name: 'Graphic Design',
    type: 'Creative',
    urgency: 'Medium',
    bargainStatus: 'Fixed',
    startTime: DateTime(2025, 9, 12, 10, 0),
    endTime: DateTime(2025, 9, 12, 18, 0),
    price: 300.0,
    location: 'San Francisco, CA',
  ),
  JobModel(
    id: 'job003',
    name: 'Mobile App Development',
    type: 'IT & Software',
    urgency: 'Low',
    bargainStatus: 'Negotiable',
    startTime: DateTime(2025, 9, 15, 8, 0),
    endTime: DateTime(2025, 9, 20, 17, 0),
    price: 1200.0,
    location: 'Remote',
  ),
  JobModel(
    id: 'job004',
    name: 'Event Planning',
    type: 'Management',
    urgency: 'High',
    bargainStatus: 'Fixed',
    startTime: DateTime(2025, 9, 25, 14, 0),
    endTime: DateTime(2025, 9, 25, 22, 0),
    price: 500.0,
    location: 'Chicago, IL',
  ),
  JobModel(
    id: 'job005',
    name: 'House Cleaning',
    type: 'Maintenance',
    urgency: 'Medium',
    bargainStatus: 'Negotiable',
    startTime: DateTime(2025, 9, 18, 9, 0),
    endTime: DateTime(2025, 9, 18, 13, 0),
    price: 100.0,
    location: 'Austin, TX',
  ),
];
