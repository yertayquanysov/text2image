import 'dart:typed_data';

import 'package:image_gallery_saver_v3/image_gallery_saver.dart';

abstract class SaveToGalleryService {
  void save(Uint8List? data);
}

class SaveToGalleryServiceImpl implements SaveToGalleryService {
  @override
  void save(Uint8List? data) {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      ImageGallerySaver.saveImage(data!, name: fileName);
    } catch (e) {
      print("Error save post");
    }
  }
}
