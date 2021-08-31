import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostTemplate extends StatelessWidget {
  const PostTemplate({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(28),
      color: Colors.white,
      child: AutoSizeText(
        text,
        minFontSize: 18,
        maxFontSize: 22,
        style: GoogleFonts.ubuntu(
          fontSize: 22,
          color: Colors.black87,
        ),
      ),
    );
  }
}
