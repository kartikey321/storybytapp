import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../models/story.dart';

class PlayerScreen extends StatefulWidget {
  final Story story;
  const PlayerScreen({super.key, required this.story});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer player = AudioPlayer();

  // ValueNotifiers for managing state
  final ValueNotifier<bool> _isPlaying = ValueNotifier<bool>(false);
  final ValueNotifier<Duration> _progress = ValueNotifier<Duration>(Duration.zero);
  final ValueNotifier<Duration> _buffered = ValueNotifier<Duration>(Duration.zero);
  final ValueNotifier<Duration> _total = ValueNotifier<Duration>(Duration.zero);
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    // Load the audio URL and handle the states
    player.setUrl('https://wapking.name/files/download/type/320/id/4304',
      tag: MediaItem(
        id: widget.story.id,
        album: widget.story.name,
        title: widget.story.name,
        artUri: Uri.parse(widget.story.thumbnailUrl),
      ),
    ).then((_) {
      _isLoading.value = false;
      _total.value = player.duration ?? Duration.zero;
    }).catchError((error) {
      _isLoading.value = false;
    });

    // Listen to the progress updates
    player.positionStream.listen((position) {
      _progress.value = position;
    });

    // Listen to buffered position updates
    player.bufferedPositionStream.listen((bufferedPosition) {
      _buffered.value = bufferedPosition;
    });

    // Listen to player state changes
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        _isPlaying.value = false;
      }
    });

    // Listen to playing state changes
    player.playingStream.listen((playing) {
      _isPlaying.value = playing;
    });

    // Listen to duration changes
    player.durationStream.listen((duration) {
      if (duration != null) {
        _total.value = duration;
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    _isPlaying.dispose();
    _progress.dispose();
    _buffered.dispose();
    _total.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isPlaying.value) {
      player.pause();
    } else {
      player.play();
    }
  }

  void _onSeek(Duration newDuration) {
    if (newDuration >= _total.value || newDuration > _buffered.value) {
      _isLoading.value = true;
      player.seek(newDuration).then((_) {
        if (player.playing) {
          _isLoading.value = false;
        }
      }).catchError((error) {
        _isLoading.value = false;
      });
    } else {
      player.seek(newDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF25282F).withOpacity(0.0),
                const Color(0xFF13161B).withOpacity(0.638),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back button
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
                        image: NetworkImage(widget.story.thumbnailUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),

              // Story Name
              Text(
                widget.story.name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),

              // Publisher Name
              Text(
                widget.story.publisherName,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // Progress bar
              ValueListenableBuilder<bool>(
                valueListenable: _isLoading,
                builder: (context, isLoading, child) {
                  return ValueListenableBuilder<Duration>(
                    valueListenable: _progress,
                    builder: (context, progress, child) {
                      return ValueListenableBuilder<Duration>(
                        valueListenable: _total,
                        builder: (context, total, child) {
                          return ProgressBar(
                            progress: progress,
                            buffered: _buffered.value,
                            total: total,
                            onSeek: _onSeek,
                            timeLabelTextStyle: const TextStyle(color: Colors.white),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 60),

              // Play/Pause and Skip Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ImageIcon(
                    AssetImage('assets/skip_back.png'),
                    size: 35,
                    color: Colors.white,
                  ),
                  const Icon(
                    Foundation.previous,
                    size: 35,
                    color: Colors.white,
                  ),

                  // Play/Pause button using ValueListenableBuilder
                  ValueListenableBuilder<bool>(
                    valueListenable: _isPlaying,
                    builder: (context, isPlaying, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          // Show loading indicator if audio is loading
                          ValueListenableBuilder<bool>(
                            valueListenable: _isLoading,
                            builder: (context, loading, child) {
                              if (loading) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: _togglePlayPause,
                          ),
                        ],
                      );
                    },
                  ),

                  const Icon(
                    Foundation.next,
                    size: 35,
                    color: Colors.white,
                  ),
                  const ImageIcon(
                    AssetImage('assets/skip_forward.png'),
                    size: 35,
                    color: Colors.white,
                  ),
                ],
              ),
              const Spacer(),

              // Bookmark and Download Icons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesome.bookmark_o,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}