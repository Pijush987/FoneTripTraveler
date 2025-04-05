import 'dart:ui';

import '../../../utils/utils.dart';
import '../../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Backgroundimg extends StatelessWidget {
  final Widget content;
  const Backgroundimg({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage(AssetsPath.introImg1),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // Gradient Overlay
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(240, 54, 68, 136)
                      .withValues(colorSpace: ColorSpace.displayP3),
                  const Color.fromARGB(207, 5, 14, 62)
                      .withValues(colorSpace: ColorSpace.displayP3),
                  const Color.fromARGB(232, 5, 14, 62)
                      .withValues(colorSpace: ColorSpace.displayP3),
                  ThemeConfig.color010620
                ],
              ),
            ),
          ),
          // Text Content
          content
        ],
      ),
    );
  }
}
