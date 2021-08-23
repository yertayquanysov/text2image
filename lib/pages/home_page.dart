import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_post_maker/pages/post_page.dart';
import 'package:insta_post_maker/services/file_service.dart';
import 'package:insta_post_maker/widgets/post_item.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String passedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insta Content"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              minLines: 3,
              maxLines: 30,
              onChanged: (text) => passedText = text,
              decoration: InputDecoration(
                hintText: "Текстті енгіз",
              ),
            ),
            MaterialButton(
              child: const Text("Пост жасау"),
              color: Colors.greenAccent,
              onPressed: () => Get.to(PostPage(passedText)),
            ),
          ],
        ),
      ),
    );
  }
}
