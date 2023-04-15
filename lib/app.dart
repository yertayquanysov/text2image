import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_post_maker/pages/home_page.dart';

class CreatorApp extends StatelessWidget {
  const CreatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: GoogleFonts.ubuntu(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
