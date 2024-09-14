import 'dart:math';

import 'package:storybytapp/models/story.dart';

List<Story> generateFakeStories(
  int count,
) {
  List<String> thumbnailUrls = [
    "https://cancerfocusni.org/wp-content/uploads/2019/10/Music-Notes-300-x-200-Event-page-thumbnail-300x200.png",
    "https://cdn.pixabay.com/photo/2023/09/29/14/58/road-8284023_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/07/31/15/01/girl-869213_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/10/20/18/35/earth-1756274_640.jpg",
    "https://cdn.pixabay.com/photo/2017/08/02/05/49/recording-2570056_640.jpg",
  ];
  final List<String> sampleTags = [
    'Technology',
    'Science',
    'Art',
    'History',
    'Music',
    'Culture'
  ];
  final List<String> sampleNames = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
    'Tom Wilson'
  ];
  final random = Random();

  List<Story> stories = List.generate(count, (index) {
    return Story(
      id: 'story_$index',
      name: 'Story ${index + 1}',
      description: 'Description of Story ${index + 1}',
      thumbnailUrl: thumbnailUrls[random
          .nextInt(thumbnailUrls.length)], // Randomly pick a thumbnail URL
      audioUrl: 'https://example.com/audio_$index.mp3',
      audioLength:
          '${random.nextInt(60)}:${random.nextInt(60).toString().padLeft(2, '0')}', // Random minutes and seconds
      publisherId: 'publisher_${random.nextInt(1000)}',
      publisherName: sampleNames[random.nextInt(sampleNames.length)],
      likes: List.generate(
          random.nextInt(100), (likeIndex) => 'user_${random.nextInt(1000)}'),
      tags: List.generate(
          3, (tagIndex) => sampleTags[random.nextInt(sampleTags.length)]),
    );
  });

  return stories;
}
