import 'package:flutter/material.dart';
import 'package:tower_block_test/widget/Common/orientation_layout.dart';

class SelectBlockWG extends StatelessWidget {
  final Widget child;
  final List<Widget> selectButtons;

  const SelectBlockWG({
    Key? key,
    required this.child,
    required this.selectButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var len = selectButtons.length;

    return OrientationLayout(
      portrait: Column(
        children: [
          Expanded(
            child: child,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: selectButtons,
            ),
          ),
        ],
      ),
      landscape: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: selectButtons.getRange(0, len ~/ 2).toList(),
            ),
          ),
          child,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: selectButtons.getRange(len ~/ 2, len).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
