import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPaint extends CustomPainter {
  Future<ui.Image> getImage() async {
    final recorder = ui.PictureRecorder();

    paint(Canvas(recorder), const Size(1080, 1080));

    final picture = recorder.endRecording();
    return await picture.toImage(1080, 1080);
  }

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = Colors.green;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.width), paint);

    final TextPainter text = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: "Make Flutter app",
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
    );

    text.layout(minWidth: 0, maxWidth: size.width - 30);
    text.paint(canvas, Offset(20, 20));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
