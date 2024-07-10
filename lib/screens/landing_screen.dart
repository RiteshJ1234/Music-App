import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/screens/main_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: 648,
            child: Image.asset(
              "lib/assets/landing.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 420, left: 44),
            child: Text(
              "Dancing between The shadows Of rhythm",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 605,
              left: screenWidth / 2 - 130.5,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MainScreen();
                    },
                  ),
                );
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
                fixedSize: MaterialStatePropertyAll(
                  Size(261, 47),
                ),
              ),
              child: Text(
                "Get Started",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 668,
              left: screenWidth / 2 - 130.5,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MainScreen();
                    },
                  ),
                );
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  fixedSize: MaterialStatePropertyAll(
                    Size(261, 47),
                  ),
                  side:
                      MaterialStatePropertyAll(BorderSide(color: Colors.red))),
              child: Text(
                "Continue with Email",
                style: GoogleFonts.inter(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 750, left: 88, right: 88),
            child: Text(
              "by continuing you agree to terms of services and Privacy policy",
              style: GoogleFonts.inter(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
