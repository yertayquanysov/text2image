import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_post_maker/pages/post_page.dart';
import 'package:lorem_ipsum_nonrandom/lorem_ipsum_nonrandom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String passedText = "";

  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ПостМакер"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            TextField(
              minLines: 3,
              maxLines: 30,
              onChanged: (text) => passedText = text,
              controller: _editingController,
              decoration: InputDecoration(
                hintText: "Текстті енгіз",
              ),
            ),
            MaterialButton(
              child: const Text("Пост жасау"),
              color: Colors.greenAccent,
              onPressed: () => Get.to(PostPage(_editingController.text)),
            ),
            Visibility(
              visible: !kReleaseMode,
              child: MaterialButton(
                child: const Text("Generate text"),
                color: Colors.greenAccent,
                onPressed: () => _editingController.text =
                    LoremIpsum.provideText(letters: 1000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
