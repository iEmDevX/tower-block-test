import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tower_block_test/state_manage/block_pvd.dart';
import 'package:tower_block_test/state_manage/size_block_pvd.dart';
import 'package:tower_block_test/widget/Common/orientation_layout.dart';
import 'package:provider/provider.dart';
import 'package:tower_block_test/widget/project/progress_press_wg.dart';

class SelectBlockWG extends StatefulWidget {
  final Widget child;
  final List<Widget> selectButtons;

  const SelectBlockWG({
    Key? key,
    required this.child,
    required this.selectButtons,
  }) : super(key: key);

  @override
  State<SelectBlockWG> createState() => _SelectBlockWGState();
}

class _SelectBlockWGState extends State<SelectBlockWG> {
  GlobalKey keyGray = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => context.read<SizeBlockPVD>().setGrayWidth());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var len = widget.selectButtons.length;
    context.read<SizeBlockPVD>().setGrayBlockKey(keyGray);
    return OrientationLayout(
      portrait: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              key: keyGray,
              child: widget.child,
            ),
          ),
          const ProgressPressWG(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.selectButtons,
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
              children: widget.selectButtons.getRange(0, len ~/ 2).toList(),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    key: keyGray,
                    child: widget.child,
                  ),
                ),
                const ProgressPressWG(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.selectButtons.getRange(len ~/ 2, len).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
