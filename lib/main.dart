import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_bloc.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/services/text_service.dart';
import 'package:logger/logger.dart';

import 'app.dart';

final logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final SaveToGalleryService galleryService = SaveToGalleryServiceImpl();
  final TextService textService = TextServiceImpl();

  return runApp(
    MultiBlocProvider(
      child: CreatorApp(),
      providers: [
        BlocProvider(
          create: (_) => PostCreatorBloc(
            galleryService,
            textService,
          ),
        ),
      ],
    ),
  );
}
