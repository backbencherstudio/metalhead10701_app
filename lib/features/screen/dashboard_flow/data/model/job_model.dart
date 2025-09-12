class JobModel{
  final String id;
  final String clientId;
  final String name;
  final String type;
  final String bargainStatus;
  final DateTime startTime;
  final DateTime endTime;
  final double price;
  final String location;
  final String? urgency;
  final String status;
  final String? description;
  final String? experience;
  final String? tools;
  final String? instruction;
  final List<String>? imgUrl;
  final String? note;

  const JobModel({
    required this.id,
    required this.clientId,
    required this.name,
    required this.type,
    required this.bargainStatus,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.location,
    this.urgency,
    this.status = "Running",
    this.description,
    this.experience,
    this.tools,
    this.instruction,
    this.imgUrl,
    this.note
});
}

// Dummies
final jobs = <JobModel>[
  JobModel(id: 'job1', clientId: 'client1', name: 'Plumbing', type: 'Repair', bargainStatus: 'Fixed', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 3)), price: 100.0, location: 'LA'),
  JobModel(id: 'job2', clientId: 'client1', name: 'Painting', type: 'Service', bargainStatus: 'Hourly', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 2)), price: 200.0, location: 'NY'),
  JobModel(id: 'job3', clientId: 'client2', name: 'Cleaning', type: 'Routine', bargainStatus: 'Hourly', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 1)), price: 80.0, location: 'TX'),
  JobModel(id: 'job6', clientId: 'client4', name: 'Gardening', type: 'Outdoor', bargainStatus: 'Fixed', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 4)), price: 110.0, location: 'NV', urgency: "high"),
  JobModel(id: 'job7', clientId: 'client5', name: 'Cooking', type: 'Catering', bargainStatus: 'Hourly', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 1)), price: 120.0, location: 'MS', urgency: "Very High"),
  JobModel(id: 'job8', clientId: 'client6', name: 'Dog Walking', type: 'Pet', bargainStatus: 'Fixed', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 1)), price: 50.0, location: 'IL', urgency: "Very High"),
  JobModel(id: 'job9', clientId: 'client7', name: 'Babysitting', type: 'Childcare', bargainStatus: 'Hourly', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 6)), price: 180.0, location: 'NJ', urgency: "Very High"),
  JobModel(id: 'job4', clientId: 'client3', name: 'Moving', type: 'Transport', bargainStatus: 'Fixed', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 5)), price: 300.0, location: 'FL'),
  JobModel(id: 'job5', clientId: 'client3', name: 'Tutoring', type: 'Lesson', bargainStatus: 'Hourly', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 2)), price: 150.0, location: 'WA'),
  JobModel(id: 'job10', clientId: 'client8', name: 'IT Support', type: 'Tech', bargainStatus: 'Fixed', startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 5)), price: 250.0, location: 'CA', urgency: "Very High"),
];

final urgentJobs = jobs.where((job) => job.urgency != null).toList();
