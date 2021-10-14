import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';
import 'package:tower_block_test/shape/custom_paint/daimond_shape_cp.dart';
import 'package:tower_block_test/shape/shape_super.dart';

// ignore: must_be_immutable
class DaimondShapeWG extends StatelessWidget with ShapeSuper {
  DaimondShapeWG({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  final Color color;

  @override
  Future<void> destoyBlock() async {
    return;
  }

  @override
  Widget build(BuildContext context) {
    isSpecialShape = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          painter: DiamondPainter(
            strokeColor: ColorConstatnt.border,
            fillColor: color,
            strokeWidth: 1,
          ),
          child: const SizedBox(
            height: 150,
            width: 150,
          ),
        ),
      ],
    );
  }
}
