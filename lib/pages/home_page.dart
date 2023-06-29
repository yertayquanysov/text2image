import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
            const SizedBox(height: 20),
            CupertinoButton(
              child: Text(
                "Create posts",
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed("/post_page");
                context
                    .read<PostCreatorBloc>()
                    .generatePosts(_textController.text);
              },
            ),
            Visibility(
              visible: kDebugMode,
              child: CupertinoButton(
                child: const Text("Generate text"),
                onPressed: () => _textController.text =
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
