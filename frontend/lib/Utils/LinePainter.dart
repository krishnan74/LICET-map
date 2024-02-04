import 'dart:ui';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double animationValue; // Animation value to control line position
  final Set<String> shortestPathSet; // Set of vertices representing the shortest path

  LinePainter(this.animationValue, this.shortestPathSet);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green // Line color
      ..style = PaintingStyle.stroke // Stroke style
      ..strokeWidth = 12.0; // Stroke width

    final Map<String, List<double>> vertices = {
      "A": [55.0, 0.0],
      "F": [55.0, 152.0],
      "f": [200.0, 80.0],
      "E": [400.0,400.0]
    };

    for (int i = 0; i < shortestPathSet.length - 1; i++) {
      String startBlock = shortestPathSet.elementAt(i);
      double startBlockX = vertices[startBlock]![0];
      double startBlockY = vertices[startBlock]![1];

      String endBlock = shortestPathSet.elementAt(i + 1);
      double endBlockX = vertices[endBlock]![0];
      double endBlockY = vertices[endBlock]![1];

      final double currentX = startBlockX + (endBlockX - startBlockX) * animationValue;
      final double currentY = startBlockY + (endBlockY - startBlockY) * animationValue;

      canvas.drawLine(Offset(startBlockX, startBlockY), Offset(currentX, currentY), paint);


    }
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the line continuously
  }
}
