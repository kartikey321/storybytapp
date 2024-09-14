import 'package:flutter/material.dart';
import 'package:storybytapp/models/story.dart';

class Type1Section extends StatelessWidget {
  final String text;
  final List<Story> stories;
  final VoidCallback onMoreClick;
  final bool broadSection;
  final void Function(Story story) onStoryClicked;
  const Type1Section(
      {super.key,
      required this.stories,
      required this.text,
      required this.onMoreClick,
      this.broadSection = false,
      required this.onStoryClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: broadSection ? 277 : 260,
      margin: const EdgeInsets.symmetric(vertical: 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA7A7A7)),
              ),
              IconButton(
                  onPressed: onMoreClick,
                  icon: Text(
                    'more',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFACACAC),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  var story = stories[index];
                  return InkWell(
                    onTap: () {
                      onStoryClicked.call(story);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: broadSection ? 172 : 103,
                            height: broadSection ? 172 : 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(story.thumbnailUrl))),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            story.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            story.publisherId,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Type2Section extends StatelessWidget {
  final String text;
  final Story story;
  final VoidCallback onMoreClick;

  final VoidCallback onStoryClicked;
  const Type2Section(
      {super.key,
      required this.story,
      required this.text,
      required this.onMoreClick,
      required this.onStoryClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA7A7A7)),
              ),
              IconButton(
                  onPressed: onMoreClick,
                  icon: Text(
                    'more',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFACACAC),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onStoryClicked.call();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(story.thumbnailUrl))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
