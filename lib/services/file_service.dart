import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:retry/retry.dart';
import 'package:screenshot/screenshot.dart';
import 'package:uuid/uuid.dart';

abstract class FileRepository {
  void saveImages(List<Uint8List> images);
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveImages(List<Uint8List> images) {}

  void saveToGallery(Uint8List? data) {
    try {
      final fileName = Uuid().v4();
      ImageGallerySaver.saveImage(data!, name: fileName);
    } catch (e) {
      print("Error save post");
    }
  }
}
