import 'package:flutter/material.dart';
import 'package:tower_block_test/color_constant.dart';

class CircleShapeWG extends StatelessWidget {
  const CircleShapeWG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var diameter = MediaQuery.of(context).orientation == Orientation.landscape ? width * 0.1 : height * 0.1;

    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        color: ColorConstatnt.blue,
        shape: BoxShape.circle,
        border: Border.all(color: ColorConstatnt.border),
      ),
    );
  }
}
