import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_bloc.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/services/text_service.dart';
import 'package:insta_post_maker/widgets/default_progress_bar.dart';
import 'package:insta_post_maker/widgets/post_item.dart';
import 'package:screenshot/screenshot.dart';

import '../extensions.dart';

class PostPage extends StatefulWidget {
  const PostPage(this.passedText);

  final String passedText;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _textService = TextServiceImpl();
  final _fileRepository = FileRepositoryImpl();
  final Queue<ScreenshotController> _screenshotControllers = Queue.from([]);

  late final PostSaveBloc _postSaveBloc;
  List<Widget> _posts = [];

  @override
  void initState() {
    super.initState();

    _postSaveBloc = PostSaveBloc(_fileRepository);

    generateWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            children: _posts,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          _screenshotControllers.forEach((sc) {
            sc.capture(pixelRatio: 3).then((image) {
              _fileRepository.saveToGallery(image);
            });
          });
        },
      ),
    );
  }

  void generateWidgets() {
    final textList = _textService.getPages(widget.passedText);
    _posts = textList
        .map((text) => _postWidget(text, textList.last != text))
        .toList();
  }

  Widget _postWidget(String text, bool isNotLastText) {
    final _screenshotController = ScreenshotController();
    _screenshotControllers.add(_screenshotController);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Screenshot(
        controller: _screenshotController,
        child: PostTemplate(
          text: text,
          isNotLastText: isNotLastText,
        ),
      ),
    );
  }
}
