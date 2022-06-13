import 'package:collection/collection.dart';

class Huffman {
  HuffmanNode? _root;
  Map<String, String> _code = <String, String>{};
  String _encoded = '';

  HuffmanNode? get root {
    return _root;
  }

  Map<String, String> get code => _code;

  String get encoded => _encoded;

  Huffman(String phrase) {
    Map<String, int> freq = _count(phrase);

    PriorityQueue<HuffmanNode> queue =
        PriorityQueue((a, b) => a.frequency.compareTo(b.frequency));
    freq.forEach((key, value) {
      queue.add(HuffmanNode(key, value, null, null));
    });

    while (queue.length > 1) {
      HuffmanNode x = queue.removeFirst();
      HuffmanNode y = queue.removeFirst();

      HuffmanNode f = HuffmanNode('-', x.frequency + y.frequency, x, y);

      _root = f;

      queue.add(f);
    }
    if (_root != null) _printCode(_root!, "");
    phrase.split('').forEach((c) {
      _encoded += _code[c] ?? '';
    });
  }

  Map<String, int> _count(String phrase) {
    Map<String, int> result = <String, int>{};
    phrase.split('').forEach((c) {
      result.update(c, (value) => value + 1, ifAbsent: () => 1);
    });
    return result;
  }

  void _printCode(HuffmanNode node, String s) {
    if (node.left == null && node.right == null) {
      var c = {node.character: s};
      _code.addAll(c);
    } else {
      _printCode(node.left!, '${s}0');
      _printCode(node.right!, '${s}1');
    }
  }
}

class HuffmanNode {
  final String character;
  final int frequency;

  HuffmanNode? left;
  HuffmanNode? right;

  HuffmanNode(this.character, this.frequency, this.left, this.right);

  @override
  String toString() {
    return '$character $frequency';
  }
}
