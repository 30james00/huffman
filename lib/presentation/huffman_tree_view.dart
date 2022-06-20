import 'package:flutter/material.dart';
import 'package:huffman/application/huffman.dart';

class HuffmanTreeView extends StatelessWidget {
  const HuffmanTreeView(
      {Key? key, required this.root, required this.huffmanHeight})
      : super(key: key);

  final HuffmanNode root;
  final int huffmanHeight;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: SizedBox(
        width: 500,
        height: 400,
      ),
      painter: HuffmanTreePainter(huffmanHeight, root),
    );
  }
}

class HuffmanTreePainter extends CustomPainter {
  final HuffmanNode root;
  final int huffmanHeight;

  HuffmanTreePainter(this.huffmanHeight, this.root);
  final Paint paintP = Paint()
    ..color = Colors.black
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    double offsetVert = size.height / huffmanHeight;
    _paintNode(root, size.width / 2.0, 0, size.width / 2.0, offsetVert, canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _paintNode(
    HuffmanNode node,
    double width,
    double heigth,
    double offsetH,
    double offsetV,
    Canvas canvas,
  ) {
    double radius = 15;
    canvas.drawCircle(Offset(width, heigth), radius, paintP);
    if (node.left != null) {
      double newWidth = width - offsetH;
      double newHeigth = heigth + offsetV;
      canvas.drawLine(Offset(width - radius, heigth + radius),
          Offset(newWidth + radius, newHeigth - radius), paintP);
      _paintNode(
          node.left!, newWidth, newHeigth, offsetH / 2.0, offsetV, canvas);
    }
    if (node.right != null) {
      double newWidth = width + offsetH;
      double newHeigth = heigth + offsetV;
      canvas.drawLine(Offset(width + radius, heigth + radius),
          Offset(newWidth - radius, newHeigth - radius), paintP);
      _paintNode(
          node.right!, newWidth, newHeigth, offsetH / 2.0, offsetV, canvas);
    }
  }
}
