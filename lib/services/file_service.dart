import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';

abstract class FileRepository {
  void saveToGallery(Uint8List? data);
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveToGallery(Uint8List? data) {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      ImageGallerySaver.saveImage(data!, name: fileName);
    } catch (e) {
      print("Error save post");
    }
  }
}
