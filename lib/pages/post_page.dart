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
  PostPage(this.passedText);

  final String passedText;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  final  _textService = TextServiceImpl();
  final List<ScreenshotController> controllers = [];
  final _fileRepository = FileRepositoryImpl();

  late final PostSaveBloc _postSaveBloc;

  @override
  void initState() {
    _postSaveBloc = PostSaveBloc(_fileRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            children: _textService.getPages(widget.passedText).map((e) {
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
