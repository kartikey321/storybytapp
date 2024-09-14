import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/story.dart';

class MoreCategory extends StatelessWidget {
  final List<Story> stories;
  const MoreCategory({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Category',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        AlignedGridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: stories.length,
            crossAxisSpacing: 16,
            mainAxisSpacing: 21,
            crossAxisCount: 3,
            itemBuilder: (context, index) {
              var story = stories[index];
              return SizedBox(
                height: 186,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(story.thumbnailUrl))),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          story.name,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 8,
                              color: Color(0xFFACACAC),
                            ),
                            Text(
                              '10.8k',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      story.publisherId,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}
