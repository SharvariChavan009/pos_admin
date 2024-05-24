import 'dart:convert';

class Tenant {
  final int? id;
  final String? name;
  final String? image;
  final String? website;
  final bool active;
  final String? meta;
  final String? gst;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Tenant({
      this.image,
      this.website,
      this.gst,
     this.id,
     this.name,
    required this.active,
    this.meta,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
});

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      name: json['name'],
      website: json['website'],
      image: json['image'],
      gst: json['gst'],
      active: json['active'],
      meta: json['meta'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gst': gst,
      'image': image,
      'website': website,
      'name': name,
      'active': active,
      'meta': meta,
      'deleted_at': deletedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

List<Tenant> tenantsFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Tenant>.from(jsonData['data'].map((x) => Tenant.fromJson(x)));
}

String usersToJson(List<Tenant> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}
