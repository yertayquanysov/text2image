abstract class FileRepository {
  void saveToGallery();
}

class FileRepositoryImpl implements FileRepository {
  @override
  void saveToGallery() async {
    /*var image = await res.toByteData(format: ImageByteFormat.png);

    final PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      ImageGallerySaver.saveImage(
        image!.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes),
        name: "app",
      );
    }*/
  }
}
