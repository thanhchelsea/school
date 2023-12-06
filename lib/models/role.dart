import 'dart:convert';

class Role {
  String roleName;
  String description;
  Role({
    required this.roleName,
    required this.description,
  });

  Role copyWith({
    String? roleName,
    String? description,
  }) {
    return Role(
      roleName: roleName ?? this.roleName,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roleName': roleName,
      'description': description,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      roleName: map['roleName'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source));

  @override
  String toString() => 'Role(roleName: $roleName, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Role && other.roleName == roleName && other.description == description;
  }

  @override
  int get hashCode => roleName.hashCode ^ description.hashCode;
}
