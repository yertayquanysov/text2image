import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:uuid/uuid.dart';

abstract class FileRepository {
  void saveToGallery(Uint8List data);
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveToGallery(Uint8List data) async {
    final fileName = Uuid().v4();

    ImageGallerySaver.saveImage(data, name: fileName);
  }
}
