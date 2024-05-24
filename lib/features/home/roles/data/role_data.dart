import 'dart:convert';

class Role {
  final int? id;
  final String? name;
  final String? guardName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Role({
    this.guardName,
    this.id,
    this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      guardName: json['guard_name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'guard_name':guardName,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

List<Role> rolesFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Role>.from(jsonData['data'].map((x) => Role.fromJson(x)));
}

String rolesToJson(List<Role> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}
