import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMagin = size.width * 0.1;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: bodyMagin),
        child: Stack(
          children: [
            const Image(image: AssetImage('assets/images/intro_bg.png')),
            Column(
              children: [
                Text('PUPPY',style: GoogleFonts.bebasNeue()),
                Text('PUPPY',style: GoogleFonts.bebasNeue()),
                Text('PUPPY',style: GoogleFonts.bebasNeue()),
                Text('PUPPY',style: GoogleFonts.bebasNeue()),
              ],
            )

          ],
        ),
      ),
    );
  }
}

