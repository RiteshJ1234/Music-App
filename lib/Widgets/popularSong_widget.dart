import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/Model/song_model.dart';

class PopularSongWidget extends StatelessWidget {
  final int index;
  final SongModel songData;
  const PopularSongWidget(
      {Key? key, required this.index, required this.songData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              songData.songImage,
              height: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songData.songName,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                ),
                Text(
                  "${songData.releseYear}",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
