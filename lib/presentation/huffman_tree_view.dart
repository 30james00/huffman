import 'package:flutter/material.dart';
import 'package:huffman/application/huffman.dart';

class HuffmanTreeView extends StatelessWidget {
  const HuffmanTreeView({Key? key, required this.root}) : super(key: key);

  final HuffmanNode? root;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HuffmanTreePainter(),
    );
  }
}

class HuffmanTreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
