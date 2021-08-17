import 'package:flutter/material.dart';
import 'package:insta_post_maker/pages/home_page.dart';

void main() => runApp(PostMaker());

class PostMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
