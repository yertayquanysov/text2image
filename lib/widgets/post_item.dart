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
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            text,
            minFontSize: 20,
            maxFontSize: 22,
            style: GoogleFonts.ubuntu(
              color: Colors.black87,
              height: 1.3,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "@ertai.quanyshov",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                visible: isNotLastText,
                child: Icon(
                  FontAwesomeIcons.arrowCircleRight,
                  size: 35,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
