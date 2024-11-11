import 'package:storybytapp/models/story_album.dart';

import '../dioHelper/dio_helper.dart';

class AlbumData {
  static Future<List<StoryAlbum>> getData(List<String> ids) async {
    DioClient dioClient = DioClient();
    return dioClient.get('api/storyAlbum/getData').then((e) =>
        (e as List<Map<String, dynamic>>)
            .map((e1) => StoryAlbum.fromMap(e1))
            .toList());
  }
}
