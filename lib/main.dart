import 'package:flutter/material.dart';
import 'package:tower_block_test/color_constant.dart';
import 'package:tower_block_test/shape/custom_paint/daimond_shape_cp.dart';
import 'package:tower_block_test/shape/custom_paint/triangle_shape_cp.dart';
import 'package:tower_block_test/shape/widget/circle_shape_wg.dart';
import 'package:tower_block_test/shape/widget/daimond_shape_wg.dart';
import 'package:tower_block_test/shape/widget/square_shape_wg.dart';
import 'package:tower_block_test/shape/widget/triangle_shape_wg.dart';
import 'package:tower_block_test/widget/Common/orientation_layout.dart';
import 'package:tower_block_test/widget/project/select_block_wg.dart';

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
    return Scaffold(
      backgroundColor: ColorConstatnt.grayBG,
      body: SelectBlockWG(
        child: Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DaimondShapeWG(),
                const SquareShapeWG(),
                const SquareShapeWG(),
                const SquareShapeWG(),
                const SquareShapeWG(),
                const SquareShapeWG(),
                const SquareShapeWG(),
                const SquareShapeWG(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TrianglrShapeWG(),
                    SquareShapeWG(),
                    TrianglrShapeWG(triangleShape: TriangleShape.baseRight),
                  ],
                ),
              ],
            ),
          ),
        ),
        selectButtons: const [
          CircleShapeWG(),
          CircleShapeWG(),
        ],
      ),
    );
  }
}
