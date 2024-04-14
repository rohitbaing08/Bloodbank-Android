class CampModel {
  final String name;
  final String date;
  final String location;

  CampModel({
    required this.name,
    required this.date,
    required this.location,
  });

  factory CampModel.fromJson(Map<String, dynamic> json) {
    return CampModel(
      name: json['name'],
      date: json['date'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'location': location,
    };
  }
}
