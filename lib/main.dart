import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tower_block_test/const/color_constant.dart';
import 'package:tower_block_test/shape/widget/circle_shape_wg.dart';
import 'package:tower_block_test/state_manage/block_pvd.dart';
import 'package:tower_block_test/state_manage/size_block_pvd.dart';
import 'package:tower_block_test/widget/project/arrow_selected_wg.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BlockPVD()..init(),
            lazy: false,
          ),
          ChangeNotifierProvider(create: (_) => SizeBlockPVD()),
        ],
        child: const MainUI(),
      ),
    );
  }
}

class MainUI extends StatelessWidget {
  const MainUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = context.watch<BlockPVD>().child;
    var colors = context.read<BlockPVD>().colors;

    return Scaffold(
      backgroundColor: ColorConstatnt.grayBG,
      body: SelectBlockWG(
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 14),
          shrinkWrap: true,
          reverse: true,
          itemCount: child.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: index == 0 ? ArrowSelectWG(child: child[index]) : child[index],
            );
          },
        ),
        selectButtons: colors.map((color) {
          var index = colors.indexOf(color);
          return CircleShapeWG(fillColor: color, indexBtn: index);
        }).toList(),
      ),
    );
  }
}
