import 'package:just_audio/just_audio.dart';
import 'package:music_app/Model/song_model.dart';

class SongListProvider {
  List<AudioSource> trending = [
    AudioSource.asset(
      "lib/assets/song/angaaron.mp3",
      tag: SongModel(
        songName: "Angaaron",
        trendingSongImage:
            "lib/assets/Songurl/Trending/treanding_angaarosa.jpg",
        songImage: "lib/assets/Songurl/Trending/angaaron.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/paon ki jutti.mp3",
      tag: SongModel(
        songName: "Paon ki jutti",
        trendingSongImage:
            "lib/assets/Songurl/Trending/treanding_paon_ki_juti.jpg",
        songImage: "lib/assets/Songurl/Trending/paon_ki_juti.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/pushpa pushpa.mp3",
      tag: SongModel(
        songName: "Pushpa Pushpa",
        trendingSongImage:
            "lib/assets/Songurl/Trending/treanding_pushpa_pushpa.jpg",
        songImage: "lib/assets/Songurl/Trending/pushpa_pushpa.jpg",
        releseYear: 2024,
      ),
    ),
  ];

  List<AudioSource> newRelese = [
    AudioSource.asset(
      "lib/assets/song/kurchi_madharpatti.mp3",
      tag: SongModel(
        songName: "Kurchi Madathapetti",
        songImage: "lib/assets/Songurl/NewRelease/kurchi mardhapetti.jpg",
        releseYear: 2023,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/armadam.mp3",
      tag: SongModel(
        songName: "Aveshsam",
        songImage: "lib/assets/Songurl/NewRelease/avesham.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/chitralekha.mp3",
      tag: SongModel(
        songName: "Chitralekha",
        songImage: "lib/assets/Songurl/NewRelease/chitralekha.jpg",
        releseYear: 2022,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/nazar_kadh_deva.mp3",
      tag: SongModel(
        songName: "Nazar Kadh Deva",
        songImage: "lib/assets/Songurl/NewRelease/nazar_kadh_deva.jpg",
        releseYear: 2023,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/angaaron.mp3",
      tag: SongModel(
        songName: "Angaaron",
        songImage: "lib/assets/Songurl/NewRelease/angaaron.jpg",
        releseYear: 2024,
      ),
    ),
  ];
  List<AudioSource> popular = [
    AudioSource.asset(
      "lib/assets/song/welcome to my zindagi.mp3",
      tag: SongModel(
        songName: "Welcome to my Zindagi",
        songImage: "lib/assets/Songurl/popular/Welcome.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/Nandanandanaa.mp3",
      tag: SongModel(
        songName: "Nandanandanaa",
        songImage: "lib/assets/Songurl/popular/Nandanandanaa.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/angaaron.mp3",
      tag: SongModel(
        songName: "Angaaron",
        songImage: "lib/assets/Songurl/NewRelease/angaaron.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/chitralekha.mp3",
      tag: SongModel(
        songName: "Chitralekha",
        songImage: "lib/assets/Songurl/NewRelease/chitralekha.jpg",
        releseYear: 2022,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/armadam.mp3",
      tag: SongModel(
        songName: "Aveshsam",
        songImage: "lib/assets/Songurl/NewRelease/avesham.jpg",
        releseYear: 2024,
      ),
    ),
    AudioSource.asset(
      "lib/assets/song/nazar_kadh_deva.mp3",
      tag: SongModel(
        songName: "Nazar Kadh Deva",
        songImage: "lib/assets/Songurl/NewRelease/nazar_kadh_deva.jpg",
        releseYear: 2023,
      ),
    ),
  ];
}
