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
        title: const Text("Пост Макер"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            TextField(
              minLines: 5,
              maxLines: 30,
              onChanged: (text) => passedText = text,
              controller: _editingController,
              decoration: InputDecoration(
                hintText: "Текстті енгіз",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            TextButton(
              child: const Text("Пост жасау"),
              onPressed: () => Get.to(PostPage(_editingController.text)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.black12.withOpacity(0.03),
                ),
              ),
            ),
            Visibility(
              visible: !kReleaseMode,
              child: TextButton(
                child: const Text("Generate text"),
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
