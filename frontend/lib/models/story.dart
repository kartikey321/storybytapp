// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Story {
String id;
String name;
String description;
String thumbnailUrl;
String audioUrl;
String audioLength;
String publisherId;
String publisherName;
List<String> likes;
List<String> tags;
  Story({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.audioUrl,
    required this.audioLength,
    required this.publisherId,
    required this.publisherName,
    required this.likes,
    required this.tags,
  });


  Story copyWith({
    String? id,
    String? name,
    String? description,
    String? thumbnailUrl,
    String? audioUrl,
    String? audioLength,
    String? publisherId,
    String? publisherName,
    List<String>? likes,
    List<String>? tags,
  }) {
    return Story(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      audioLength: audioLength ?? this.audioLength,
      publisherId: publisherId ?? this.publisherId,
      publisherName: publisherName ?? this.publisherName,
      likes: likes ?? this.likes,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'audioUrl': audioUrl,
      'audioLength': audioLength,
      'publisherId': publisherId,
      'publisherName': publisherName,
      'likes': likes,
      'tags': tags,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      audioUrl: map['audioUrl'] as String,
      audioLength: map['audioLength'] as String,
      publisherId: map['publisherId'] as String,
      publisherName: map['publisherName'] as String,
      likes: List<String>.from((map['likes'] as List<String>),),
      tags: List<String>.from((map['tags'] as List<String>),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Story(id: $id, name: $name, description: $description, thumbnailUrl: $thumbnailUrl, audioUrl: $audioUrl, audioLength: $audioLength, publisherId: $publisherId, publisherName: $publisherName, likes: $likes, tags: $tags)';
  }

  @override
  bool operator ==(covariant Story other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.thumbnailUrl == thumbnailUrl &&
      other.audioUrl == audioUrl &&
      other.audioLength == audioLength &&
      other.publisherId == publisherId &&
      other.publisherName == publisherName &&
      listEquals(other.likes, likes) &&
      listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      thumbnailUrl.hashCode ^
      audioUrl.hashCode ^
      audioLength.hashCode ^
      publisherId.hashCode ^
      publisherName.hashCode ^
      likes.hashCode ^
      tags.hashCode;
  }
}
