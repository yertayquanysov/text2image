import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

abstract class SaveState {}

class PostSaved extends SaveState {}

class PostResult extends SaveState {}

class ProgressBar extends SaveState {}

class PostSaveException extends SaveState {
  final String message;

  PostSaveException(this.message);
}

class PostSaveBloc extends Cubit<SaveState> {
  final FileRepository _fileRepository;

  PostSaveBloc(this._fileRepository) : super(PostResult());

  Future save(List<ScreenshotController> controllers) async {
    try {
      emit(ProgressBar());

      final PermissionStatus status = await Permission.storage.request();


      if (status.isGranted) {
        await Future.forEach(
          controllers,
          (ScreenshotController sc) async {
            final response = await sc.capture(pixelRatio: 3);

            if (response != null) {
              _fileRepository.saveToGallery(response);
            }
          },
        );

        emit(PostSaved());
      }else{
        emit(PostSaveException("Сақтауға рұқсат беріңіз"));
      }


    } catch (e) {
      emit(PostSaveException("Сақтау кезінде қателік!"));
    }
  }
}
