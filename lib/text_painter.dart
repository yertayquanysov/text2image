import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPaint extends CustomPainter {

  Future<ui.Image> getImage() async {
    final recorder = ui.PictureRecorder();

    paint(Canvas(recorder), const Size(300, 300));

    final picture = recorder.endRecording();
    return await picture.toImage(300, 300);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset offset = const Offset(20, 20);

    final TextSpan span = TextSpan(
      text:
          "In this Flutter Tutorial, I am Introducing a new Flutter SVG Converter Tool to convert SVGs to Custom Paint Code in a matter of seconds.",
      style: GoogleFonts.ubuntu(
        color: Colors.red,
        fontSize: 18.0,
      ),
    );

    final paint = Paint()..color = Colors.red.withOpacity(0.03);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.width), paint);

    final TextPainter _tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    );

    _tp.layout(minWidth: 0, maxWidth: size.width - 30);
    _tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
