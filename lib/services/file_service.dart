import 'dart:typed_data';

import 'package:image_gallery_saver_v3/image_gallery_saver.dart';

abstract class SaveToGalleryService {
  Future<void> save(Uint8List? data);
}

class SaveToGalleryServiceImpl implements SaveToGalleryService {
  @override
  Future<void> save(Uint8List? data) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      await ImageGallerySaver.saveImage(data!, name: fileName);
    } catch (e) {
      print("Error save post");
    }
  }
}
