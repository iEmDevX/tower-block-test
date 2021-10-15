import 'package:flutter_test/flutter_test.dart';
import 'package:tower_block_test/shape/shape_super.dart';
import 'package:tower_block_test/shape/widget/daimond_shape_wg.dart';
import 'package:tower_block_test/shape/widget/square_shape_wg.dart';

import 'package:tower_block_test/state_manage/block_pvd.dart';

void main() {
  var blockPvd = BlockPVD();

  test('Test init Value', () async {
    blockPvd.init();

    expect(blockPvd.child.length, 10);

    for (var i = 0; i < 9; i++) {
      expect(blockPvd.child[i] is SquareShapeWG, true);
    }
    expect(blockPvd.child[9] is DaimondShapeWG, true);
  });

  test('remove general Block', () async {
    for (var i = 0; i < 9; i++) {
      ShapeSuper shape = blockPvd.child[0] as ShapeSuper;
      blockPvd.startCountTime(shape.color, 0);
      await Future.delayed(const Duration(milliseconds: 2500));
      blockPvd.endCountTime(0);
    }
    expect(blockPvd.child.length, 1);
  });

  test('remove special Block', () async {
    ShapeSuper shape = blockPvd.child[0] as ShapeSuper;
    blockPvd.startCountTime(shape.color, 0);
    blockPvd.startCountTime(shape.color, 1);
    await Future.delayed(const Duration(milliseconds: 2500));

    blockPvd.endCountTime(0);
    blockPvd.endCountTime(1);
    expect(blockPvd.child.length, 0);
  });

  test('Test reset Value', () async {
    blockPvd.reset();

    expect(blockPvd.child.length, 10);

    for (var i = 0; i < 9; i++) {
      expect(blockPvd.child[i] is SquareShapeWG, true);
    }
    expect(blockPvd.child[9] is DaimondShapeWG, true);
  });
}
