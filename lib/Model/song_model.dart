class SongModel {
  final String songName;
  final String songImage;
  final int releseYear;
  final String? trendingSongImage;

  SongModel({
    required this.songName,
    required this.songImage,
    required this.releseYear,
    this.trendingSongImage,
  });
}
