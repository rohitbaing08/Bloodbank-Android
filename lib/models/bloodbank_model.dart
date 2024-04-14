class BloodbankModel {
  final String name;
  final String email;
  final String location;
  final String contact;
  final String image;

  BloodbankModel({
    required this.name,
    required this.email,
    required this.location,
    required this.contact,
    required this.image,
  });

  factory BloodbankModel.fromJson(Map<String, dynamic> json) {
    return BloodbankModel(
      name: json['name'],
      email: json['email'],
      location: json['location'],
      contact: json['contact'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'contact': contact,
      'image': image,
    };
  }
}
