import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';
import 'package:tower_block_test/state_manage/block_pvd.dart';
import 'package:provider/provider.dart';

class CircleShapeWG extends StatelessWidget {
  final Color fillColor;
  final int indexBtn;

  const CircleShapeWG({
    Key? key,
    required this.fillColor,
    required this.indexBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var diameter = MediaQuery.of(context).orientation == Orientation.landscape ? width * 0.1 : height * 0.1;

    return GestureDetector(
      onTapDown: (_) {
        context.read<BlockPVD>().seContext(context);
        context.read<BlockPVD>().startCountTime(fillColor, indexBtn);
        // context.read<SizeBlockPVD>().printKey();
      },
      onTapUp: (_) {
        context.read<BlockPVD>().endCountTime(indexBtn);
      },
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: fillColor,
          shape: BoxShape.circle,
          border: Border.all(color: ColorConstatnt.border),
        ),
      ),
    );
  }
}
