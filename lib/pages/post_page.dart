import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/services/text_service.dart';
import 'package:insta_post_maker/widgets/post_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class PostPage extends StatelessWidget {
  PostPage(this.passedText);

  final TextService _textService = TextServiceImpl();
  final List<ScreenshotController> controllers = [];
  final String passedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Посттар"),
      ),
      body: ListView(
        children: _textService.getPages(passedText).map((e) {
          final controller = ScreenshotController();
          controllers.add(controller);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Screenshot(
              controller: controller,
              child: PostTemplate(text: e),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => saveImage(),
      ),
    );
  }

  void saveImage() async {
    final PermissionStatus status = await Permission.storage.request();
    final FileRepository fileRepo = FileRepositoryImpl();

    if (status.isGranted) {
      await Future.forEach(controllers, (ScreenshotController sc) async {
        final response = await sc.capture(pixelRatio: 3);

        print(response);

        if (response != null) {
          fileRepo.saveToGallery(response);
        }
      });
    }
  }
}
