import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class FileRepository {
  void saveToGallery(Uint8List data);
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveToGallery(Uint8List data) async {
    final PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      ImageGallerySaver.saveImage(data, name: "app");
    }
  }
}
