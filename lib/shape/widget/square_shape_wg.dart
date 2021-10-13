import 'package:flutter/material.dart';
import 'package:tower_block_test/color_constant.dart';

class SquareShapeWG extends StatelessWidget {
  const SquareShapeWG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var heightSquare = MediaQuery.of(context).orientation == Orientation.landscape ? width * 0.08 : height * 0.08;

    return Container(
      height: heightSquare,
      width: width * 0.3,
      decoration: BoxDecoration(
        color: ColorConstatnt.blue,
        border: Border.all(color: ColorConstatnt.border),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
