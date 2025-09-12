class ClientModel{
  final String id;
  final String name;
  final String phone;
  final String? imgUrl;
  final String? mail;
  final String? location;
  final String? city;
  final String? state;
  final String? zip;
  final DateTime? birthday;
  final String? bio;
  final String? skill;
  final List<String>? jobIds;
  ClientModel({
  required this.id,
    required this.name,
    required this.phone,
    this.imgUrl,
    this.mail,
    this.location,
    this.city,
    this.state,
    this.zip,
    this.birthday,
    this.bio,
    this.skill,
    this.jobIds,
});
}


//dummyClients
final clients = <ClientModel>[
  ClientModel(id: 'client1', name: 'Alice', phone: '1111111111', jobIds: ['job1', 'job2']),
  ClientModel(id: 'client2', name: 'Bob', phone: '2222222222', jobIds: ['job3']),
  ClientModel(id: 'client3', name: 'Carol', phone: '3333333333', jobIds: ['job4', 'job5']),
  ClientModel(id: 'client4', name: 'Dave', phone: '4444444444', jobIds: ['job6']),
  ClientModel(id: 'client5', name: 'Eve', phone: '5555555555', jobIds: ['job7']),
  ClientModel(id: 'client6', name: 'Frank', phone: '6666666666', jobIds: ['job8']),
  ClientModel(id: 'client7', name: 'Grace', phone: '7777777777', jobIds: ['job9']),
  ClientModel(id: 'client8', name: 'Heidi', phone: '8888888888', jobIds: ['job10']),
  ClientModel(id: 'client9', name: 'Ivan', phone: '9999999999', jobIds: []),
  ClientModel(id: 'client10', name: 'Judy', phone: '1010101010', jobIds: []),
];