import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';

enum TriangleShape { baseLeft, baseRight }

class TrianglePainter extends CustomPainter {
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;
  final TriangleShape triangleShape;

  TrianglePainter({
    this.fillColor = Colors.white,
    this.strokeColor = ColorConstatnt.border,
    this.strokeWidth = 1,
    this.triangleShape = TriangleShape.baseLeft,
  }) : assert(strokeWidth >= 0);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getTrianglePath(size.width, size.height);
    Paint paintFill = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paintFill);

    Paint paintStroke = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, paintStroke);
  }

  Path getTrianglePath(double x, double y) {
    if (triangleShape == TriangleShape.baseLeft) {
      return Path()
        ..moveTo(0, 0)
        ..lineTo(0, y)
        ..lineTo(x, y / 2)
        ..lineTo(0, 0);
    } else if (triangleShape == TriangleShape.baseRight) {
      return Path()
        ..moveTo(0, y / 2)
        ..lineTo(x, y)
        ..lineTo(x, 0)
        ..lineTo(0, y / 2);
    }
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, y)
      ..lineTo(x, y / 2)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor || oldDelegate.fillColor != fillColor || oldDelegate.strokeWidth != strokeWidth;
  }
}
