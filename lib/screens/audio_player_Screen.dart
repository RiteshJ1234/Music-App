import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/Model/position_data.dart';
import 'package:music_app/Model/song_model.dart';
import 'package:music_app/Widgets/audio_data_widget.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerScreen extends StatefulWidget {
  final int index;
  final List<AudioSource> playerList;
  const AudioPlayerScreen(
      {Key? key, required this.index, required this.playerList})
      : super(key: key);

  @override
  State createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final player = AudioPlayer();
  late List<AudioSource> playerList;
  late ConcatenatingAudioSource playlist =
      ConcatenatingAudioSource(children: widget.playerList);

  @override
  void initState() {
    super.initState();
    playerList = widget.playerList;
    _init();
  }

  Future<void> _init() async {
    await player.setLoopMode(LoopMode.all);
    await player.setAudioSource(playlist, initialIndex: widget.index);
    player.play();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.red, Colors.black],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            StreamBuilder<SequenceState?>(
              stream: player.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? true) {
                  return const SizedBox();
                }
                final metadata = state!.currentSource!.tag as SongModel;
                return AudioDataWidget(songData: metadata);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return ProgressBar(
                  thumbColor: Colors.white,
                  progressBarColor: Colors.white,
                  timeLabelTextStyle: GoogleFonts.kameron(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  total: positionData?.duration ?? Duration.zero,
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  onSeek: player.seek,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    player.seekToPrevious();
                    player.play();
                  },
                  icon: const Icon(
                    Icons.skip_previous_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 60,
                ),
                StreamBuilder<PlayerState>(
                  stream: player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 64.0,
                        height: 64.0,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (playing != true) {
                      return IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill_rounded,
                          color: Colors.white,
                        ),
                        iconSize: 80.0,
                        onPressed: player.play,
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        icon: const Icon(
                          Icons.pause_circle_filled_rounded,
                          color: Colors.white,
                        ),
                        iconSize: 80.0,
                        onPressed: player.pause,
                      );
                    } else {
                      return IconButton(
                        icon: const Icon(
                          Icons.replay_circle_filled_rounded,
                          color: Colors.white,
                        ),
                        iconSize: 80.0,
                        onPressed: () => player.seek(Duration.zero),
                      );
                    }
                  },
                ),
                IconButton(
                  onPressed: () {
                    player.seekToNext();
                    player.play();
                  },
                  icon: const Icon(
                    Icons.skip_next_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
