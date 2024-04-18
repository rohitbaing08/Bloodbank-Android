class UserModel {
  final String id;
  final String name;
  final String address;
  final String locality;
  final String age;
  final String contact;
  final String bloodgroup;
  final String adhaarNo;
  final String email;
  final String username;
  final String password;
  final bool canDonate;

  UserModel({
    required this.name,
    required this.address,
    required this.locality,
    required this.age,
    required this.bloodgroup,
    required this.adhaarNo,
    required this.email,
    required this.username,
    required this.password,
    required this.id,
    required this.contact,
    required this.canDonate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        locality: json['locality'],
        age: json['age'],
        contact: json['contact'],
        bloodgroup: json['bloodgroup'],
        adhaarNo: json['adhaarNo'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        canDonate: json['canDonate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'locality': locality,
      'age': age,
      'contact': contact,
      'bloodgroup': bloodgroup,
      'adhaarNo': adhaarNo,
      'email': email,
      'username': username,
      'password': password,
      'canDonate': canDonate
    };
  }
}
