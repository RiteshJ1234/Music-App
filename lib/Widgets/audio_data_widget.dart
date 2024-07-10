import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/Model/song_model.dart';

class AudioDataWidget extends StatelessWidget {
  final SongModel songData;
  const AudioDataWidget({Key? key, required this.songData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  songData.songImage,
                  height: 350,
                ),
              ),
            ),
            const Spacer(),
            Text(
              songData.songName,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
