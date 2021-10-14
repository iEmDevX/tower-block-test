import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';
import 'package:tower_block_test/shape/shape_super.dart';
import 'package:tower_block_test/shape/widget/daimond_shape_wg.dart';
import 'package:tower_block_test/shape/widget/square_shape_wg.dart';
import 'package:tower_block_test/widget/project/dialog.dart';

class BlockPVD with ChangeNotifier {
  final colors = [ColorConstatnt.pink, ColorConstatnt.blue];

  var child = <Widget>[];

  DateTime? startTime;
  DateTime? endTime;
  int timeUse = 0;

  bool isPress = false;
  Map<int, int> successPress = <int, int>{};

  final _durationTime = const Duration(milliseconds: 200);

  BuildContext? buildContext;
  GlobalKey key = GlobalKey();

  init() {
    child.clear();
    for (var i = 0; i < 9; i++) {
      child.add(SquareShapeWG(color: colors[Random().nextInt(colors.length)]));
    }
    child.add(DaimondShapeWG(color: ColorConstatnt.purple));
    notifyListeners();
  }

  reset() {
    buildContext = null;
    isPress = false;
    successPress.clear();
    startTime = null;
    endTime = null;
    timeUse = 0;
    init();
  }

  _checkDeleteBlock(Color color) async {
    Widget selectShapeWG = child[0];
    if (selectShapeWG is! ShapeSuper) {
      return;
    }
    ShapeSuper selectShape = selectShapeWG as ShapeSuper;

    if (selectShape.isSpecialShape) {
      int success = 0;
      successPress.forEach((key, value) {
        if (value >= 2000) success++;
      });

      if (success >= 2) {
        _removeBlock(selectShape);
      }
    } else if (!selectShape.isSpecialShape && color == selectShape.color) {
      _removeBlock(selectShape);
    }
  }

  _removeBlock(ShapeSuper selectShape) async {
    await selectShape.destoyBlock();
    child.removeAt(0);
    _setTimer();
    notifyListeners();
  }

  _setTimer() {
    if (startTime == null) {
      startTime = DateTime.now();
    } else if (child.isEmpty) {
      endTime = DateTime.now();
      timeUse = endTime!.difference(startTime!).inSeconds;
      _openDialog();
    }
  }

  startCountTime(Color color, int index, BuildContext buildContext) {
    print(key.currentContext?.size?.width);
    // if (this.buildContext == null) {
    //   this.buildContext = buildContext;
    // }
    // isPress = true;
    // _countTime(color, index);
  }

  endCountTime(int index) {
    isPress = false;
    successPress.remove(index);
  }

  _countTime(Color color, int index) async {
    while (isPress) {
      await Future.delayed(_durationTime);
      int count = (successPress[index] ?? 0) + 200;
      successPress[index] = count;
      if (count >= 2000) {
        _checkDeleteBlock(color);
        break;
      }
    }
  }

  _openDialog() {
    showDialog(
      context: buildContext!,
      builder: (context) {
        return DialogWG(
          timeUse: timeUse,
        );
      },
    ).then((value) => reset());
  }
}
