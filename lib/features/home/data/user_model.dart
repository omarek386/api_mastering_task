class UserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String createdAt;
  final num latitude;
  final num longitude;
  final String? profilePic;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.createdAt,
    required this.latitude,
    required this.longitude,
    required this.profilePic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['user']['name'],
      email: json['user']['email'],
      profilePic: json['user']['profilePic'],
      phoneNumber: json['user']['phone'],
      createdAt: json['user']['createdAt'],
      latitude: json['user']['location']['coordinates'][0],
      longitude: json['user']['location']['coordinates'][1],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
      'latitude': latitude,
      'longitude': longitude,
      'profilePic': profilePic,
    };
  }
}
