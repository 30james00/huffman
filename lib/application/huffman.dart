import 'package:collection/collection.dart';

class Huffman {
  HuffmanNode? root;

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

      root = f;

      queue.add(f);
    }

    if (root != null) printCode(root!, "");
  }

  Map<String, int> _count(String phrase) {
    Map<String, int> result = <String, int>{};
    for (int c in phrase.runes) {
      result.update(String.fromCharCode(c), (value) => value + 1,
          ifAbsent: () => 1);
    }
    return result;
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

void printCode(HuffmanNode node, String s) {
  if (node.left == null && node.right == null)
    print('${node.character} : $s');
  else {
    printCode(node.left!, '${s}0');
    printCode(node.right!, '${s}1');
  }
}
