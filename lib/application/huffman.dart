import 'package:collection/collection.dart';

Map<String, int> count(String phrase) {
  Map<String, int> result = <String, int>{};
  for (int c in phrase.runes) {
    result.update(String.fromCharCode(c), (value) => value + 1,
        ifAbsent: () => 1);
  }
  return result;
}

class Huffman {
  Huffman(Map<String, int> phrase) {
    PriorityQueue<HuffmanNode> queue =
        PriorityQueue((a, b) => a.frequency.compareTo(b.frequency));
    phrase.forEach((key, value) {
      queue.add(HuffmanNode(key, value, null, null));
    });
  }
}

class HuffmanNode {
  final String letter;
  final int frequency;

  HuffmanNode? left;
  HuffmanNode? right;

  HuffmanNode(this.letter, this.frequency, this.left, this.right);

  @override
  String toString() {
    return '$letter $frequency';
  }
}
