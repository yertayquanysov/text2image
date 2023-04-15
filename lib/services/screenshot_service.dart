import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotService {
  final _screenshot = ScreenshotController();

  Future<List<Uint8List>> getBytesFromWidgets(List<Widget> widgets) async {
    final tasks = widgets
        .map((widget) async => await _screenshot.captureFromWidget(widget))
        .toList();

    return Future.wait(tasks);
  }
}
