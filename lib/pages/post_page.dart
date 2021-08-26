import 'package:flutter/material.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/services/text_service.dart';
import 'package:insta_post_maker/widgets/post_item.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class PostPage extends StatelessWidget {
  PostPage(this.passedText);

  final TextService _textService = TextServiceImpl();
  final String passedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Посттар"),
      ),
      body: ListView(
        children: _textService.getPages(passedText).map((e) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Screenshot(
              controller: ScreenshotController(),
              child: PostTemplate(
                text: e,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void saveImage() async {
    final PermissionStatus status = await Permission.storage.request();

   /* if (status.isGranted) {
      final response = await _screenshotController.capture();
      final FileRepository _fileRepo = FileRepositoryImpl();

      _fileRepo.saveToGallery(response!);
    }*/
  }
}
