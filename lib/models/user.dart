import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:school_manager/models/role.dart';

enum Gender {
  Male,
  Female,
  Other,
}

class User {
  String username;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  int dateOfBirth;
  Gender gender;
  String address;
  String nickName;
  int status;
  String avatarUrl;
  String sessionId;
  List<Role> roles;
  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.nickName,
    required this.status,
    required this.avatarUrl,
    required this.sessionId,
    required this.roles,
  });

  User copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    int? dateOfBirth,
    Gender? gender,
    String? address,
    String? nickName,
    int? status,
    String? avatarUrl,
    String? sessionId,
    List<Role>? roles,
  }) {
    return User(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      nickName: nickName ?? this.nickName,
      status: status ?? this.status,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      sessionId: sessionId ?? this.sessionId,
      roles: roles ?? this.roles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'gender': gender == Gender.Male
          ? 0
          : gender == Gender.Female
              ? 1
              : 2,
      'address': address,
      'nickName': nickName,
      'status': status,
      'avatarUrl': avatarUrl,
      'sessionId': sessionId,
      'roles': roles.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? 0,
      gender: map['gender'] != null
          ? map['gender'] == 0
              ? Gender.Male
              : map['gender'] == 1
                  ? Gender.Female
                  : Gender.Other
          : Gender.Male,
      address: map['address'] ?? '',
      nickName: map['nickName'] ?? '',
      status: map['status']?.toInt() ?? 0,
      avatarUrl: map['avatarUrl'] ?? '',
      sessionId: map['sessionId'] ?? '',
      roles: List<Role>.from(map['roles']?.map((x) => Role.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(username: $username, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, dateOfBirth: $dateOfBirth, gender: $gender, address: $address, nickName: $nickName, status: $status, avatarUrl: $avatarUrl, sessionId: $sessionId, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.address == address &&
        other.nickName == nickName &&
        other.status == status &&
        other.avatarUrl == avatarUrl &&
        other.sessionId == sessionId &&
        listEquals(other.roles, roles);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        nickName.hashCode ^
        status.hashCode ^
        avatarUrl.hashCode ^
        sessionId.hashCode ^
        roles.hashCode;
  }
}
