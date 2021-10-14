import 'package:flutter/material.dart';

abstract class ShapeSuper {
  abstract final Color color;
  bool isSpecialShape = false;
  Future<void> destoyBlock();
}
