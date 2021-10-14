import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_bloc.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/services/text_service.dart';
import 'package:insta_post_maker/widgets/default_progress_bar.dart';
import 'package:insta_post_maker/widgets/post_item.dart';
import 'package:screenshot/screenshot.dart';

import '../extensions.dart';

class PostPage extends StatelessWidget {

  PostPage(this.passedText);

  final TextService _textService = TextServiceImpl();
  final List<ScreenshotController> controllers = [];
  final String passedText;

  final FileRepository _fileRepository = FileRepositoryImpl();

  late final PostSaveBloc _postSaveBloc;

  @override
  Widget build(BuildContext context) {

    _postSaveBloc = PostSaveBloc(_fileRepository);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Посттар"),
      ),
      body: BlocConsumer(
        bloc: _postSaveBloc,
        listener: (BuildContext context, state) {
          if (state is PostSaveException) {
            showMessage(state.message);
          }

          if (state is PostSaved) {
            showMessage("Посттар сақталды. Галереядан қараңыз.");
          }
        },
        builder: (BuildContext context, Object? state) {

          if (state is ProgressBar) {
            return DefaultProgressBar();
          }

          return ListView(
            children: _textService.getPages(passedText).map((e) {
              final controller = ScreenshotController();
              controllers.add(controller);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Screenshot(
                  controller: controller,
                  child: PostTemplate(text: e),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => _postSaveBloc.save(controllers),
      ),
    );
  }
}
