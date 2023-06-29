abstract class TextService {
  List<String> getPages(String text);
}

class TextServiceImpl implements TextService {
  final limit = 400;

  @override
  List<String> getPages(String text) {
    final pageCount = (text.length / limit).ceil();

    return List.generate(
      pageCount,
      (idx) => getTextExcerpt(idx, text),
    ).toList();
  }

  String getTextExcerpt(int idx, String text) {
    if (text.length < limit) {
      return text;
    }

    return text.substring(idx, limit);
  }
}
