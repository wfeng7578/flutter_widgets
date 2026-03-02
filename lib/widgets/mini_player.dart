import 'package:code/constant/app_constant.dart';
import 'package:flutter/material.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 2,
          bottom: 2,
          right: 2,
          child: Container(
            width: AppConstant.srceenWidth,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [Color(0xff89f7fe), Color(0xff66a6ff)])),
          ),
        ),
      ],
    );
  }
}
