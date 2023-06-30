import 'package:insta_post_maker/main.dart';

abstract class TextService {
  List<String> getPages(String text);
}

class TextServiceImpl implements TextService {
  final limit = 420;

  @override
  List<String> getPages(String text) {
    final pageCount = (text.length / limit).ceil();

    return List.generate(
      pageCount,
      (idx) => getTextExcerpt(idx, text, pageCount),
    ).toList();
  }

  String getTextExcerpt(int idx, String text, int pageCount) {
    final start = idx * limit;
    final end = limit;

    logger.w(start);

    if (idx + 1 == pageCount) {
      return text.substring(start, null);
    }

    return text.substring(start, end);
  }
}
