import 'package:flutter/material.dart';

class DefaultProgressBar extends StatelessWidget {
  const DefaultProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
