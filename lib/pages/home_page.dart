import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/post_bloc.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text2Post"),
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
                onPressed: () {
                  rootBundle
                      .loadString("assets/testing_text")
                      .then((value) => _textController.text = value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
