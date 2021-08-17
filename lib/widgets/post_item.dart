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
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(28),
      margin: const EdgeInsets.all(20),
      color: Colors.black12,
      child: Text(
        text,
        style: GoogleFonts.ubuntu(fontSize: 22),
      ),
    );
  }
}