import 'package:flutter/material.dart';

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
      ],
    );
  }
}
