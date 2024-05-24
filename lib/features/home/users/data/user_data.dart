import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final DateTime? emailVerifiedAt;
  final String? profilePhotoPath;
  final bool active;
  final String? tz;
  final String? meta;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.emailVerifiedAt,
    this.profilePhotoPath,
    required this.active,
    this.tz,
    this.meta,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      profilePhotoPath: json['profile_photo_path'],
      active: json['active'],
      tz: json['tz'],
      meta: json['meta'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      profilePhotoUrl: json['profile_photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'profile_photo_path': profilePhotoPath,
      'active': active,
      'tz': tz,
      'meta': meta,
      'deleted_at': deletedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'profile_photo_url': profilePhotoUrl,
    };
  }
}

List<User> usersFromJson(String str) {
  final jsonData = json.decode(str);
  return List<User>.from(jsonData['data'].map((x) => User.fromJson(x)));
}

String usersToJson(List<User> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}
