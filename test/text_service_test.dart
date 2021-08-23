import 'package:flutter_test/flutter_test.dart';
import 'package:insta_post_maker/config.dart';
import 'package:insta_post_maker/services/text_service.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

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

  test("test get pages: 2 page", () {
    final text = _textService.getPages(loremIpsum(words: 30));

    print(text);

    expect(text.length, 2);
  });
}
