import 'dart:ui';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:insta_post_maker/text_painter.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class FileRepository {
  void saveToGallery(TextPaint painter);
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveToGallery(TextPaint painter) async {
    var res = await painter.getImage();
    var image = await res.toByteData(format: ImageByteFormat.png);

    final PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      ImageGallerySaver.saveImage(
        image!.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes),
        name: "app",
      );
    }
  }
}
