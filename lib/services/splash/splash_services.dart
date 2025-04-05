import 'dart:async';
import '../services.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      if (SessionController.isLogin ?? false) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.introScreen, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.introScreen, (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false),
      );
    });
  }
}
