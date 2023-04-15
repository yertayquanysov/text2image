import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_creator_state.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/text_service.dart';

class PostCreatorBloc extends Cubit<PostCreatorState> {
  PostCreatorBloc(
    this._galleryService,
    this._textService,
  ) : super(ProgressBar());

  final SaveToGalleryService _galleryService;
  final TextService _textService;

  Future<void> generatePosts(String text) async {
    emit(ProgressBar());

    final textList = _textService.getPages(text);

    emit(PostsCreated(textList));
  }

  Future save(List<Uint8List> images) async {
    try {
      emit(ProgressBar());

      await checkGallerySavePermission();
      await _galleryService.save(images.first);

      emit(PostsSaved());
    } catch (e) {
      emit(PostCreatorException());
    }
  }

  Future<void> checkGallerySavePermission() async {
    final PermissionStatus status = await Permission.storage.request();

    if (!status.isGranted) {
      emit(PostCreatorException());
    }
  }
}
