import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_post_maker/pages/home_page.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
  return runApp(
    GetMaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
    ),
  );
}
