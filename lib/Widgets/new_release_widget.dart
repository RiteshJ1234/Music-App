import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/Model/song_model.dart';

class NewReleaseWidget extends StatelessWidget {
  final int index;
  final SongModel songData;

  const NewReleaseWidget(
      {Key? key, required this.index, required this.songData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              songData.songImage,
              height: 130,
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: Text(
            songData.songName,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
