import 'package:flutter/material.dart';
import 'package:music_app/Provider/song_list_provider.dart';
import 'package:music_app/screens/landing_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return SongListProvider();
      },
      child: const MaterialApp(
        home: LandingScreen(),
      ),
    );
  }
}
