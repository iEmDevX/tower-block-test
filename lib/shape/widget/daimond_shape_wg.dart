import 'package:flutter/material.dart';
import 'package:tower_block_test/color_constant.dart';
import 'package:tower_block_test/shape/custom_paint/daimond_shape_cp.dart';

class DaimondShapeWG extends StatelessWidget {
  const DaimondShapeWG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DiamondPainter(
        strokeColor: ColorConstatnt.border,
        fillColor: ColorConstatnt.purple,
        strokeWidth: 1,
      ),
      child: const SizedBox(
        height: 90,
        width: 90,
      ),
    );
  }
}
