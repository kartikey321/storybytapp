class StoryAlbum{
  String id;
  String name;
  String thumbnailUrl;
  String description;
  List<String> publishers;
  List<String> storyIds;
  List<String> likes;
  List<String> tags;

//<editor-fold desc="Data Methods">
  StoryAlbum({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.description,
    required this.publishers,
    required this.storyIds,
    required this.likes,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryAlbum &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          thumbnailUrl == other.thumbnailUrl &&
          description == other.description &&
          publishers == other.publishers &&
          storyIds == other.storyIds &&
          likes == other.likes &&
          tags == other.tags);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      thumbnailUrl.hashCode ^
      description.hashCode ^
      publishers.hashCode ^
      storyIds.hashCode ^
      likes.hashCode ^
      tags.hashCode;

  @override
  String toString() {
    return 'StoryAlbum{ id: $id, name: $name, thumbnailUrl: $thumbnailUrl, description: $description, publishers: $publishers, storyIds: $storyIds, likes: $likes, tags: $tags,}';
  }

  StoryAlbum copyWith({
    String? id,
    String? name,
    String? thumbnailUrl,
    String? description,
    List<String>? publishers,
    List<String>? storyIds,
    List<String>? likes,
    List<String>? tags,
  }) {
    return StoryAlbum(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      description: description ?? this.description,
      publishers: publishers ?? this.publishers,
      storyIds: storyIds ?? this.storyIds,
      likes: likes ?? this.likes,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'thumbnailUrl': thumbnailUrl,
      'description': description,
      'publishers': publishers,
      'storyIds': storyIds,
      'likes': likes,
      'tags': tags,
    };
  }

  factory StoryAlbum.fromMap(Map<String, dynamic> map) {
    return StoryAlbum(
      id: map['id'] as String,
      name: map['name'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      description: map['description'] as String,
      publishers: map['publishers'] as List<String>,
      storyIds: map['storyIds'] as List<String>,
      likes: map['likes'] as List<String>,
      tags: map['tags'] as List<String>,
    );
  }

//</editor-fold>
}