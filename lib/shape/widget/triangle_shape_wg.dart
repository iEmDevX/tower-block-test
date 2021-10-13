import 'package:flutter/material.dart';
import 'package:tower_block_test/shape/custom_paint/triangle_shape_cp.dart';

class TrianglrShapeWG extends StatelessWidget {
  final TriangleShape triangleShape;
  const TrianglrShapeWG({
    Key? key,
    this.triangleShape = TriangleShape.baseLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(
        strokeWidth: 1,
        triangleShape: triangleShape,
      ),
      child: const SizedBox(
        height: 20,
        width: 24,
      ),
    );
  }
}
