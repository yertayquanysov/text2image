import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'app.dart';

final logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(CreatorApp());
}
