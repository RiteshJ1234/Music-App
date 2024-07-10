import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/Model/song_model.dart';
import 'package:music_app/Provider/song_list_provider.dart';
import 'package:music_app/Widgets/new_release_widget.dart';
import 'package:music_app/Widgets/popularSong_widget.dart';
import 'package:music_app/screens/audio_player_Screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CarouselController bottomCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Trending songs

              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Trending",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              FlutterCarousel.builder(
                itemCount: context.watch<SongListProvider>().trending.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  final audioSource =
                      SongListProvider().trending[itemIndex] as UriAudioSource;
                  final songModel = audioSource.tag as SongModel;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AudioPlayerScreen(
                            index: itemIndex,
                            playerList:
                                context.read<SongListProvider>().trending,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(songModel.trendingSongImage!),
                    ),
                  );
                },
                options: CarouselOptions(
                    aspectRatio: 20 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                    floatingIndicator: true),
              ),

              // New Release Song
              //

              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, bottom: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "New Release",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: context.watch<SongListProvider>().newRelese.length,
                  itemBuilder: (context, index) {
                    final song = context
                        .read<SongListProvider>()
                        .newRelese[index] as UriAudioSource;
                    final songData = song.tag as SongModel;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return AudioPlayerScreen(
                              index: index,
                              playerList:
                                  context.read<SongListProvider>().newRelese,
                            );
                          }),
                        );
                      },
                      child: NewReleaseWidget(
                        index: index,
                        songData: songData,
                      ),
                    );
                  },
                ),
              ),

              // Popular songs
              //

              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 25, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Popular Songs",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    itemCount: context.read<SongListProvider>().popular.length,
                    itemBuilder: (context, index) {
                      final song = context
                          .read<SongListProvider>()
                          .popular[index] as UriAudioSource;
                      final songData = song.tag as SongModel;
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AudioPlayerScreen(
                                        index: index,
                                        playerList: context
                                            .read<SongListProvider>()
                                            .popular),
                              ),
                            );
                          },
                          child: PopularSongWidget(
                            index: index,
                            songData: songData,
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
