import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/widgets/post_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class HomePage extends StatelessWidget {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insta Post Maker"),
      ),
      body: Screenshot(
        controller: _screenshotController,
        child: PostTemplate(
          text:
              "This handy package can be used to capture any Widget including full screen screenshots & individual widgets like",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final response = await _screenshotController.capture();

          final fileService = FileRepositoryImpl();

          fileService.saveToGallery(response!);

          print(response);
        },
      ),
    );
  }
}
