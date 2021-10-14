import 'package:flutter/material.dart';
import 'package:tower_block_test/shape/custom_paint/triangle_shape_cp.dart';
import 'package:tower_block_test/shape/widget/triangle_shape_wg.dart';

class ArrowSelectWG extends StatelessWidget {
  final Widget child;

  const ArrowSelectWG({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 4),
          child: TrianglrShapeWG(),
        ),
        child,
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: TrianglrShapeWG(triangleShape: TriangleShape.baseRight),
        ),
      ],
    );
  }
}
