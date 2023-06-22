import 'dart:typed_data';

import 'package:image_gallery_saver_v3/image_gallery_saver.dart';

abstract class SaveToGalleryService {
  Future<void> saveImages(List<Uint8List> imageBytes);
}

class SaveToGalleryServiceImpl implements SaveToGalleryService {
  @override
  Future<void> saveImages(List<Uint8List> imageBytes) async {
    imageBytes.forEach((imageByte) async {
      await save(imageByte);
    });
  }

  Future<void> save(Uint8List imageByte) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      await ImageGallerySaver.saveImage(imageByte, name: fileName);
    } catch (e) {
      print("Error save post");
    }
  }
}
