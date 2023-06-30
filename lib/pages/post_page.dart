import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/bloc/post_bloc.dart';
import 'package:insta_post_maker/bloc/post_creator_state.dart';
import 'package:insta_post_maker/widgets/post_item.dart';

class PostViewPage extends StatelessWidget {

  List<Widget> _postWidgets = [];

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

          if (state is ProgressBar) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Progress...")),
            );
          }

          if (state is PostsSaved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Saved")),
            );
          }
        },
        buildWhen: (_, state) => state is PostsCreated,
        builder: (BuildContext context, Object? state) {
          if (state is PostsCreated) {
            final texts = state.textList;

            _postWidgets = texts
                .map((text) => _postWidget(text, texts.last != text))
                .toList();

            return ListView(
              children: _postWidgets,
            );
          }

          return LinearProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => postBloc.savePosts(_postWidgets),
      ),
    );
  }

  Widget _postWidget(String text, bool isNotLastText) {
    return PostTemplate(
      text: text,
      isNotLastText: isNotLastText,
    );
  }
}
