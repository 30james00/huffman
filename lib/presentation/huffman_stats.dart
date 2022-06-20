import 'package:flutter/material.dart';
import 'package:huffman/presentation/huffman_table.dart';
import 'package:huffman/presentation/huffman_tree_view.dart';

import '../application/huffman.dart';

class HuffmanStats extends StatelessWidget {
  const HuffmanStats({Key? key, required this.huffman}) : super(key: key);

  final Huffman huffman;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(huffman.encoded),
        Text('${huffman.entropy}'),
        Text('${huffman.avgLength}'),
        HuffmanTable(dict: huffman.code),
        HuffmanTreeView(
          root: huffman.root,
          huffmanHeight: huffman.height,
        )
      ],
    );
  }
}
