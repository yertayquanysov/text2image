import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_post_maker/pages/home_page.dart';

void main() {
  return runApp(
    GetMaterialApp(
      home: HomePage(),
      theme: ThemeData(
        accentColor: Colors.greenAccent,
        primaryColor: Colors.greenAccent,
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
    ),
  );
}