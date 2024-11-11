import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String id;
  String name;
  String? dp;
  String? email;
  String? phone;
  List<String> stories;
  List<String> favourites;
  DateTime createdDate;
  UserModel({
    required this.id,
    required this.name,
    this.dp,
    this.email,
    this.phone,
    required this.stories,
    required this.favourites,
    required this.createdDate,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? dp,
    String? email,
    String? phone,
    List<String>? stories,
    List<String>? favourites,
    DateTime? createdDate,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dp: dp ?? this.dp,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      stories: stories ?? this.stories,
      favourites: favourites ?? this.favourites,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dp': dp,
      'email': email,
      'phone': phone,
      'stories': stories,
      'favourites': favourites,
      'createdDate': createdDate.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      dp: map['dp'] != null ? map['dp'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      stories: List<String>.from((map['stories'] as List<String>),),
      favourites: List<String>.from((map['favourites'] as List<String>),),
      createdDate: DateTime.parse(map['createdDate'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, dp: $dp, email: $email, phone: $phone, stories: $stories, favourites: $favourites, createdDate: $createdDate)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.dp == dp &&
      other.email == email &&
      other.phone == phone &&
      listEquals(other.stories, stories) &&
      listEquals(other.favourites, favourites) &&
      other.createdDate == createdDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      dp.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      stories.hashCode ^
      favourites.hashCode ^
      createdDate.hashCode;
  }
}
