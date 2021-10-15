import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tower_block_test/const/color_constant.dart';
import 'package:tower_block_test/shape/shape_super.dart';
import 'package:tower_block_test/shape/widget/daimond_shape_wg.dart';
import 'package:tower_block_test/shape/widget/square_shape_wg.dart';
import 'package:tower_block_test/widget/project/dialog.dart';

class BlockPVD with ChangeNotifier {
  final colors = [ColorConstatnt.pink, ColorConstatnt.blue];
  final int delayMillisecond = 2000;
  var child = <Widget>[];

  DateTime? startTime;
  DateTime? endTime;
  int timeUse = 0;

  bool isPress = false;
  bool correctBlock = false;
  int lastIndex = 0;
  double percent = 0;
  Map<int, int> successPress = <int, int>{};

  final _durationTime = const Duration(milliseconds: 50);

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
    percent = 0;
    correctBlock = false;
    lastIndex = 0;
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
        success++;
      });

      if (success >= 2) {
        _removeBlock(selectShape);
      }
    } else if (!selectShape.isSpecialShape && color == selectShape.color) {
      _removeBlock(selectShape);
    }
  }

  _removeBlock(ShapeSuper selectShape) async {
    child.removeAt(0);
    _setTimer();
    notifyListeners();
  }

  _setTimer() {
    startTime ??= DateTime.now();
    if (child.isEmpty) {
      endTime = DateTime.now();
      timeUse = endTime!.difference(startTime!).inSeconds;
      _openDialog();
    }
  }

  seContext(BuildContext buildContext) {
    if (this.buildContext == null) {
      this.buildContext = buildContext;
    }
  }

  startCountTime(Color color, int index) async {
    _checkColor(color, index);
    notifyListeners();
    lastIndex = index;

    isPress = true;
    _countTime(color, index);
  }

  _checkColor(Color color, int index) {
    successPress[index] = 0;
    Widget selectShapeWG = child[0];
    if (selectShapeWG is! ShapeSuper) {
      return;
    }
    ShapeSuper selectShape = selectShapeWG as ShapeSuper;
    if (selectShape.isSpecialShape) {
      int pressCount = 0;
      successPress.forEach((key, value) {
        pressCount++;
      });

      if (pressCount >= 2) {
        correctBlock = true;
      }
    } else if (color == selectShape.color) {
      correctBlock = true;
    }
  }

  endCountTime(int index) {
    correctBlock = false;
    isPress = false;
    successPress.remove(index);
    percent = 0;
    notifyListeners();
  }

  _countTime(Color color, int index) async {
    while (isPress && lastIndex == index) {
      await Future.delayed(_durationTime);
      int count = (successPress[index] ?? 0) + 50;
      successPress[index] = count;

      _updatePercent();
      notifyListeners();

      if (count >= delayMillisecond) {
        _checkDeleteBlock(color);
        break;
      }
    }
  }

  _updatePercent() {
    int count = successPress[lastIndex] ?? 0;
    percent = count / delayMillisecond;
  }

  _openDialog() {
    if (buildContext == null) {
      return;
    }
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
