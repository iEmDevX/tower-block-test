import 'package:flutter/material.dart';

class SizeBlockPVD with ChangeNotifier {
  double grayWidth = 0;
  GlobalKey? _grayBlockKey;
  GlobalKey setGrayBlockKey(grayBlockKey) => _grayBlockKey = grayBlockKey;

  Size? get getSizeGrayBlock => _grayBlockKey?.currentContext?.size;

  setGrayWidth() {
    grayWidth = getSizeGrayBlock?.width ?? 0;
    notifyListeners();
  }
}
