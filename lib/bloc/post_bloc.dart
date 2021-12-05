import 'dart:typed_data';

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

  Future save(List<Uint8List> images) async {
    try {
      emit(ProgressBar());

      await checkPermission();
      _fileRepository.saveImages(images);

      emit(PostSaved());
    } catch (e) {
      emit(PostSaveException("Сақтау кезінде қателік!"));
    }
  }

  Future checkPermission() async {
    final PermissionStatus status = await Permission.storage.request();

    if (!status.isGranted) {
      emit(PostSaveException("Сақтауға рұқсат беріңіз"));
      return;
    }
  }
}
