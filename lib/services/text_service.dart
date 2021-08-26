import '../config.dart';

abstract class TextService {
  List<String> getPages(String text);
}

class TextServiceImpl implements TextService {
  @override
  List<String> getPages(String text) {
    final pageCount = (text.length / limitTextPerPage).ceil();

    return List.generate(pageCount, (idx) => getText(idx, text)).toList();
  }

  String getText(int idx, String text) {
    if (text.length < limitTextPerPage) {
      return text;
    }

    return text.substring(idx, limitTextPerPage);
  }
}
