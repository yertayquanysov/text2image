import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_creator_state.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/screenshot_service.dart';
import '../services/text_service.dart';

class PostCreatorBloc extends Cubit<PostCreatorState> {
  PostCreatorBloc(
    this._galleryService,
    this._textService,
    this._screenshotService,
  ) : super(ProgressBar());

  final SaveToGalleryService _galleryService;
  final TextService _textService;
  final ScreenshotService _screenshotService;

  Future<void> generatePosts(String text) async {
    emit(ProgressBar());

    final textList = _textService.getPages(text);

    emit(PostsCreated(textList));
  }

  Future savePosts(List<Widget> widgets) async {
    try {
      emit(ProgressBar());

      await checkGallerySavePermission();
      final imageBytes = await _screenshotService.getBytesFromWidgets(widgets);
      await _galleryService.saveImages(imageBytes);

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
