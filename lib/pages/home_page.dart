import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_post_maker/pages/post_page.dart';
import 'package:lorem_ipsum_nonrandom/lorem_ipsum_nonrandom.dart';

import '../bloc/post_bloc.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Пост Макер"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            TextField(
              minLines: 5,
              maxLines: 30,
              controller: _textController,
              decoration: InputDecoration(hintText: "You text..."),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              child: const Text("Create posts"),
              onPressed: () {
                Navigator.of(context).pushNamed("/post_page");
                context
                    .read<PostCreatorBloc>()
                    .generatePosts(_textController.text);
              },
              color: Colors.redAccent,
              textColor: Colors.white,
            ),
            Visibility(
              visible: !kReleaseMode,
              child: TextButton(
                child: const Text("Generate text"),
                onPressed: () => _textController.text =
                    LoremIpsum.provideText(letters: 1000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
