import 'package:flutter_test/flutter_test.dart';
import 'package:huffman/application/huffman.dart';

void main() {
  test("Test counting", () {
    var result = count("Sbinnn");
    expect(result['S'], 1);
    expect(result['n'], 3);
  });
}
