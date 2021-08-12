import 'package:flutter/material.dart';
import 'package:insta_post_maker/file_repository.dart';
import 'package:insta_post_maker/text_painter.dart';

void main() => runApp(PostMaker());

class PostMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _painter = TextPaint();
  final _fileRepository = FileRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insta Post Maker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomPaint(
          painter: _painter,
          child: Container(
            width: 1080,
            height: 1080,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _fileRepository.saveToGallery(_painter),
      ),
    );
  }
}
