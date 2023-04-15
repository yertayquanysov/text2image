abstract class TextService {
  List<String> getPages(String text);
}

class TextServiceImpl implements TextService {
  @override
  List<String> getPages(String text) {
    final pageCount = (text.length / 350).ceil();

    return List.generate(
      pageCount,
      (idx) => getTextExcerpt(idx, text),
    ).toList();
  }

  String getTextExcerpt(int idx, String text) {
    if (text.length < 350) {
      return text;
    }

    return text.substring(idx, 350);
  }
}
