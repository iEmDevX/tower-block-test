import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tower_block_test/state_manage/block_pvd.dart';
import 'package:provider/provider.dart';

class ProgressPressWG extends StatelessWidget {
  const ProgressPressWG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<BlockPVD>().correctBlock && context.watch<BlockPVD>().percent != 1
        ? LinearPercentIndicator(
            lineHeight: 8.0,
            percent: context.watch<BlockPVD>().percent,
            progressColor: Colors.red,
          )
        : const SizedBox(height: 8);
  }
}
