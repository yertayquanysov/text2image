import 'package:flutter_test/flutter_test.dart';
import 'package:insta_post_maker/services/text_service.dart';

void main() {
  final TextService _textService = TextServiceImpl();

  test("test get pages: single page", () {
    final result1 = _textService.getPages("Ertai Quanyshov");
    expect(result1.length, 1);

    final result2 = _textService.getPages("oauweghfigwefyugweyufgwgeyfug");
    expect(result2.length, 1);

    final result3 = _textService.getPages("aowudhaiwgdyugufgewfwef");
    expect(result3.length, 1);
  });

  test("test get pages: n page", () {
    final text1 = _textService.getPages("");
    expect(text1.length, 2);

    final text2 = _textService.getPages("");
    expect(text2.length, 3);
  });
}
