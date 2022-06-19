import 'package:flutter_test/flutter_test.dart';
import 'package:huffman/application/huffman.dart';

void main() {
  test("Test Huffman construction", () {
    var huffman = Huffman("BCAADDDCCACACAC");
    expect(huffman.root.frequency, 15);
    expect(huffman.encoded, isNotEmpty);
    expect(huffman.entropy, isNot(0));
    expect(huffman.avgLength, isNot(0));
  });
}
