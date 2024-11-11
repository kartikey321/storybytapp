import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storybytapp/helpers/custom_future_builder.dart';
import 'package:storybytapp/helpers/dataHelpers/album_data.dart';
import 'package:storybytapp/models/story_album.dart';

class AlbumScreen extends StatefulWidget {
  final StoryAlbum album;
  const AlbumScreen({super.key, required this.album});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Story Thumbnail
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.album.thumbnailUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Story Name
            Text(
              widget.album.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),

            // Publisher Name
            Text(
              widget.album.publishers[0],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          AntDesign.clockcircleo,
                          size: 9.5,
                          color: Color(0xFFB4B4B4),
                        ),
                        const SizedBox(width: 6.22),
                        Text(
                          widget.album.storyIds.length.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB4B4B4)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8.8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          AntDesign.clockcircleo,
                          size: 9.5,
                          color: Color(0xFFB4B4B4),
                        ),
                        const SizedBox(width: 6.22),
                        Text(
                          widget.album.storyIds.length.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB4B4B4)),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.share_social_outline,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.download_outline,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.album.description,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB4B4B4),
                      fontSize: 10),
                ),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  runSpacing: 14,
                  spacing: 10,
                  children: widget.album.tags
                      .map((e) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 11, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF23807B),
                        ),
                        //background: #0E373580;
                        color: Color(0xFF0E3735).withOpacity(0.5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            MaterialCommunityIcons.music_note,
                            size: 25,
                            color: Color(0xFF3AB2AD),
                          ),
                          SizedBox(width: 7.5),
                          Text(
                            'Rent Rs. 40',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xFF3AB2AD)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        //background: #0E373580;
                        color: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            MaterialCommunityIcons.bookmark_outline,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 7.5),
                          Text(
                            'Rent Rs. 40',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Episodes',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFutureBuilder(
                    future: AlbumData.getData(widget.album.storyIds),
                    builder: (context, snapshot) {
                      return ListView.builder(itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        return Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(item.thumbnailUrl),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Color(0xFFB4B4B4)),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'EP : $index',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xFFB4B4B4)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item.description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xFFB4B4B4)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  MaterialIcons.playlist_add,
                                  size: 25,
                                  color: Color(0xFFCDCDCD),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
