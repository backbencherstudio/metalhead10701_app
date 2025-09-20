class UserModel {
  String? id;
  String? name;
  String? username;
  String? email;
  String? avatar;
  String? phoneNumber;
  String? type;
  String? gender;
  String? address;
  String? state;
  String? city;
  String? zipCode;
  List<String>? skills;
  String? bio;
  String? age;
  String? dateOfBirth;
  String? createdAt;

  UserModel(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.avatar,
        this.phoneNumber,
        this.type,
        this.gender,
        this.address,
        this.state,
        this.city,
        this.zipCode,
        this.skills,
        this.bio,
        this.age,
        this.dateOfBirth,
        this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    phoneNumber = json['phone_number'];
    type = json['type'];
    gender = json['gender'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    skills = json['skills'].cast<String>();
    bio = json['bio'];
    age = json['age'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['phone_number'] = phoneNumber;
    data['type'] = type;
    data['gender'] = gender;
    data['address'] = address;
    data['state'] = state;
    data['city'] = city;
    data['zip_code'] = zipCode;
    data['skills'] = skills;
    data['bio'] = bio;
    data['age'] = age;
    data['date_of_birth'] = dateOfBirth;
    data['created_at'] = createdAt;
    return data;
  }
}

