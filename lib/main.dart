import 'package:flutter/material.dart';
import 'package:tower_block_test/color_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainUI(),
    );
  }
}

class MainUI extends StatelessWidget {
  const MainUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstatnt.grayBG,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPaint(
                  painter: DiamondPainter(
                    strokeColor: ColorConstatnt.border,
                    fillColor: ColorConstatnt.purple,
                    strokeWidth: 1,
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                  ),
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: ColorConstatnt.blue,
                    border: Border.all(color: ColorConstatnt.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: ColorConstatnt.blue,
                    border: Border.all(color: ColorConstatnt.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: ColorConstatnt.blue,
                    border: Border.all(color: ColorConstatnt.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: ColorConstatnt.blue,
                    border: Border.all(color: ColorConstatnt.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      painter: TrianglePainter(
                        strokeWidth: 1,
                      ),
                      child: const SizedBox(
                        height: 20,
                        width: 24,
                      ),
                    ),
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: ColorConstatnt.blue,
                        border: Border.all(color: ColorConstatnt.border),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    CustomPaint(
                      painter: TrianglePainter(
                        triangleShape: TriangleShape.baseRight,
                        strokeWidth: 1,
                      ),
                      child: const SizedBox(
                        height: 20,
                        width: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: height / 100 * 16.25,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: ColorConstatnt.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorConstatnt.border),
                  ),
                ),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: ColorConstatnt.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorConstatnt.border),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
