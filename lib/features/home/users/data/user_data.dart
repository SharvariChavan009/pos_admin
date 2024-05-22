class UserListResponse {
  final List<UserData> users;

  UserListResponse({
    required this.users,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    var userList = json['data'] as List;
    List<UserData> users = userList.map((userJson) => UserData.fromJson(userJson)).toList();
    return UserListResponse(
      users: users,
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final DateTime? emailVerifiedAt;
  final String? profilePhotoPath;
  final String? profilePhotoUrl;
  final bool active;
  final dynamic tz;
  final dynamic meta;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.profilePhotoPath,
    required this.active,
    required this.tz,
    required this.meta,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'] != null ? DateTime.parse(json['email_verified_at']) : null,
      profilePhotoPath: json['profile_photo_path'],
      active: json['active'],
      tz: json['tz'],
      meta: json['meta'],
      deletedAt: json['deleted_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      profilePhotoUrl: json['profile_photo_url'],
    );
  }
}
