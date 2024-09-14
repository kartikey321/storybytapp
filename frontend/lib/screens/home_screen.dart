import 'package:flutter/material.dart';
import 'package:storybytapp/data/data.dart';
import 'package:storybytapp/mixins/screen_mixin.dart';
import 'package:storybytapp/widgets/more_category.dart';
import 'package:storybytapp/widgets/type_1_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ScreenMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: -180,
              left: -180,
              child: Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      stops: [0.5, 1.0],
                      colors: [
                        const Color(0xFF092A28),
                        const Color(0xFF092A28).withOpacity(0)
                      ],
                    )),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: const Color(0xFFB4B4B4).withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/logo.png'),
                              const SizedBox(
                                width: 13,
                              ),
                              const Text(
                                'storybyt',
                                style: TextStyle(
                                    fontFamily: 'NordiquePro-Semibold',
                                    fontSize: 18.3,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const ImageIcon(
                                AssetImage('assets/theme.png'),
                                color: Colors.white,
                                size: 19,
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 19,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                const ImageIcon(
                                  AssetImage('assets/folder_videos.png'),
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RichText(
                                    text: const TextSpan(
                                        text: 'Your subscription will end on ',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                        children: [
                                      TextSpan(
                                          text: '29 Aug',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                    ]))
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 304,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/popcorn.jpg')),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      color: Colors.black.withOpacity(0.5))
                                ]),
                          ),
                          Type1Section(
                            stories: generateFakeStories(20),
                            text: 'Trending now',
                            onMoreClick: () {},
                            onStoryClicked: (story) {},
                            broadSection: true,
                          ),
                          Type1Section(
                            stories: generateFakeStories(20),
                            text: 'Mystery',
                            onMoreClick: () {},
                            onStoryClicked: (story) {},
                          ),
                          Type2Section(
                              story: generateFakeStories(1).first,
                              text: 'Trending now',
                              onMoreClick: () {},
                              onStoryClicked: () {}),
                          MoreCategory(stories: generateFakeStories(50)),
                          SizedBox(
                            height: 35,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
