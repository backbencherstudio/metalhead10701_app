class userRegistryModel {
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;
  String? type;

  userRegistryModel(
      {this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.phoneNumber,
        this.type});

  userRegistryModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    return data;
  }
}
