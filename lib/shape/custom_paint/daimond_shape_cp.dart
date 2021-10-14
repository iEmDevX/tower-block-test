import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';

class DiamondPainter extends CustomPainter {
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;

  DiamondPainter({
    this.strokeColor = Colors.white,
    this.fillColor = ColorConstatnt.border,
    this.strokeWidth = 0,
  }) : assert(strokeWidth >= 0);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getTrianglePath(size.width, size.height);

    // Draw fill
    Paint fillPaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Draw stroke
    if (strokeWidth <= 0) return;

    Paint strokePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, strokePaint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2, 0)
      ..lineTo(0, y / 2)
      ..lineTo(x / 2, y)
      ..lineTo(x, y / 2)
      ..lineTo(x / 2, 0);
  }

  @override
  bool shouldRepaint(DiamondPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor || oldDelegate.fillColor != fillColor || oldDelegate.strokeWidth != strokeWidth;
  }
}
