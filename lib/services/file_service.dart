import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';

abstract class FileRepository {
  void saveImages(List<Uint8List> images);
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveImages(List<Uint8List> images) {}

  void saveToGallery(Uint8List? data) {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      ImageGallerySaver.saveImage(data!, name: fileName);
    } catch (e) {
      print("Error save post");
    }
  }
}
