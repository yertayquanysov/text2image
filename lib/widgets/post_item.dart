import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostTemplate extends StatelessWidget {
  const PostTemplate({
    Key? key,
    required this.text,
    this.isNotLastText = true,
  }) : super(key: key);

  final String text;
  final bool isNotLastText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(18),
      width: 350,
      height: 350,
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
