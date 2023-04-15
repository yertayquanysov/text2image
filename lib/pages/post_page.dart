import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_bloc.dart';
import 'package:insta_post_maker/bloc/post_creator_state.dart';
import 'package:insta_post_maker/widgets/default_progress_bar.dart';
import 'package:insta_post_maker/widgets/post_item.dart';

class PostViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostCreatorBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Created posts"),
      ),
      body: BlocConsumer(
        bloc: postBloc,
        listener: (BuildContext context, state) {
          if (state is PostCreatorException) {}

          if (state is PostsSaved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Saved")),
            );
          }
        },
        builder: (BuildContext context, Object? state) {
          if (state is ProgressBar) {
            return DefaultProgressBar();
          }

          if (state is PostsCreated) {
            final texts = state.textList;

            return ListView(
              children: texts
                  .map((text) => _postWidget(text, texts.last != text))
                  .toList(),
            );
          }

          return LinearProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => postBloc.save(),
      ),
    );
  }

  Widget _postWidget(String text, bool isNotLastText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: PostTemplate(
        text: text,
        isNotLastText: isNotLastText,
      ),
    );
  }
}
