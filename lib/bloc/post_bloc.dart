import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_creator_state.dart';
import 'package:insta_post_maker/main.dart';
import 'package:insta_post_maker/services/file_service.dart';

class PostCreatorBloc extends Cubit<PostCreatorState> {
  final FileRepository _fileRepository;

  PostCreatorBloc(this._fileRepository) : super(ProgressBar());

  Future save(List<Uint8List> images) async {
    try {
      emit(ProgressBar());

      await checkPermission();
    } catch (e) {
      emit(PostCreatorException());
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
