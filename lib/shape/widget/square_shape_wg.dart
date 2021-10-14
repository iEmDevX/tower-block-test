import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';
import 'package:tower_block_test/shape/shape_super.dart';
import 'package:provider/provider.dart';
import 'package:tower_block_test/state_manage/size_block_pvd.dart';

// ignore: must_be_immutable
class SquareShapeWG extends StatelessWidget with ShapeSuper {
  SquareShapeWG({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  final Color color;

  set color(Color _color) {}

  @override
  Future<void> destoyBlock() async {
    return;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double widthGray = context.watch<SizeBlockPVD>().grayWidth * 0.3;
    var heightSquare = MediaQuery.of(context).orientation == Orientation.landscape ? width * 0.08 : height * 0.08;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: heightSquare,
          width: widthGray,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: ColorConstatnt.border),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
