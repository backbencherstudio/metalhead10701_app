class JobModel {
  String? id;
  String? title;
  String? category;
  String? dateAndTime;
  String? price;
  String? paymentType;
  String? jobType;
  String? location;
  String? estimatedTime;
  String? description;
  List<Requirement>? requirements;
  List<Note>? notes;
  List<dynamic>? photos; // Replace dynamic with a proper Photo model if available
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? jobStatus;
  String? currentStatus;

  JobModel({
    this.id,
    this.title,
    this.category,
    this.dateAndTime,
    this.price,
    this.paymentType,
    this.jobType,
    this.location,
    this.estimatedTime,
    this.description,
    this.requirements,
    this.notes,
    this.photos,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.jobStatus,
    this.currentStatus,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    id: json['id'] as String?,
    title: json['title'] as String?,
    category: json['category'] as String?,
    dateAndTime: json['date_and_time'] as String?,
    price: json['price'] as String?,
    paymentType: json['payment_type'] as String?,
    jobType: json['job_type'] as String?,
    location: json['location'] as String?,
    estimatedTime: json['estimated_time'] as String?,
    description: json['description'] as String?,
    requirements: json['requirements'] != null
        ? List<Requirement>.from(
        (json['requirements'] as List)
            .map((x) => Requirement.fromJson(x)))
        : [],
    notes: json['notes'] != null
        ? List<Note>.from(
        (json['notes'] as List).map((x) => Note.fromJson(x)))
        : [],
    photos: json['photos'] != null
        ? List<dynamic>.from(json['photos'] as List)
        : [],
    userId: json['user_id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    jobStatus: json['job_status'] as String?,
    currentStatus: json['current_status'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'category': category,
    'date_and_time': dateAndTime,
    'price': price,
    'payment_type': paymentType,
    'job_type': jobType,
    'location': location,
    'estimated_time': estimatedTime,
    'description': description,
    'requirements': requirements?.map((x) => x.toJson()).toList(),
    'notes': notes?.map((x) => x.toJson()).toList(),
    'photos': photos,
    'user_id': userId,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'job_status': jobStatus,
    'current_status': currentStatus,
  };
}

class Requirement {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? status;
  String? title;
  String? description;
  String? jobId;

  Requirement({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.status,
    this.title,
    this.description,
    this.jobId,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) => Requirement(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    deletedAt: json['deleted_at'] as String?,
    status: json['status'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    jobId: json['job_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
    'status': status,
    'title': title,
    'description': description,
    'job_id': jobId,
  };
}

class Note {
  String? title;
  String? description;

  Note({
    this.title,
    this.description,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    title: json['title'] as String?,
    description: json['description'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
  };
}
