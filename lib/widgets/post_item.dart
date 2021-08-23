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
      color: Colors.greenAccent,
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          fontSize: 22,
          color: Colors.black87,
        ),
      ),
    );
  }
}
