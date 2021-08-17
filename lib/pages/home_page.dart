import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_post_maker/widgets/post_item.dart';

import '../services/file_service.dart';

class HomePage extends StatelessWidget {
  final _fileRepository = FileRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insta Post Maker"),
      ),
      body: PostTemplate(
        text:
            "This handy package can be used to capture any Widget including full screen screenshots & individual widgets like",
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _fileRepository.saveToGallery(),
      ),
    );
  }
}
