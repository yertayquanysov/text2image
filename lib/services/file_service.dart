import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:uuid/uuid.dart';

abstract class FileRepository {
  Future saveImages(List<ScreenshotController> controllers);
}

class FileRepositoryImpl implements FileRepository {
  @override
  Future<void> saveImages(List<ScreenshotController> controllers) async {
    await Future.forEach(
      controllers,
      (ScreenshotController sc) async {
        final response = await sc.capture(pixelRatio: 3);

        if (response != null) {
          saveToGallery(response);
        }
      },
    );
  }

  void saveToGallery(Uint8List data) async {
    try {
      final fileName = Uuid().v4();
      ImageGallerySaver.saveImage(data, name: fileName);
    } catch (e) {
      print(e);
    }
  }
}
