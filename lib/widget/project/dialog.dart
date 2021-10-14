import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tower_block_test/const/img_path_const.dart';

class DialogWG extends StatelessWidget {
  final int timeUse;
  const DialogWG({
    Key? key,
    required this.timeUse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        image: const DecorationImage(
          image: AssetImage(ImgPathConst.dialogBG),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: height * 0.05),
                                child: const AutoSizeText(
                                  "TOTAL TIME",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF224036),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: height * 0.05),
                                child: AutoSizeText(
                                  "$timeUse S",
                                  style: const TextStyle(
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF514B4B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  child: _ButtonPlayAgain(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonPlayAgain extends StatelessWidget {
  const _ButtonPlayAgain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white.withOpacity(0.6),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AutoSizeText(
              "PLAY AGAIN",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF224036),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
