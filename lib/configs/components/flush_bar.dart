import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension FlushBarErrorMessage on BuildContext {
  void flushBarErrorMessage({required String message}) {
    showFlushbar(
        context: this,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
          padding: EdgeInsets.all(15.r),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8.r),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: ThemeConfig.colorRed,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 28.r,
            color: ThemeConfig.whiteColor,
          ),
        )..show(this));
  }
}

extension FlushBarSuccessMessage on BuildContext {
  void flushBarSuccessMessage({required String message}) {
    showFlushbar(
        context: this,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
          padding: EdgeInsets.all(15.r),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8.r),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: ThemeConfig.colorGreen,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 28.r,
            color: ThemeConfig.whiteColor,
          ),
        )..show(this));
  }
}
