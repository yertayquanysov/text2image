import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';

abstract class FileRepository {
  Future saveImages(List<ScreenshotController> controllers);
}

class FileRepositoryImpl implements FileRepository {
  @override
  Future<void> saveImages(List<ScreenshotController> controllers) async {
    controllers.forEach((element) {
      element.capture(pixelRatio: 3).then((Uint8List? data) {
        if (data != null) {
          saveToGallery(data);
        }
      });
    });
  }

  void saveToGallery(Uint8List data) async {
    try {
      final fileName = Uuid().v4();
      final saved = await ImageGallerySaver.saveImage(data, name: fileName);
      logger.i(saved);
    } catch (e) {
      logger.e(e);
    }
  }
}
