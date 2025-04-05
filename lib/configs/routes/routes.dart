import '../configs.dart';
import '../../views/views.dart';
import 'package:flutter/material.dart';
import 'package:traveler/utils/utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return PageTransition(
            child: const SplashView(), type: Const.pageTransitionType);

      case RoutesName.login:
        return PageTransition(
            child: const LoginScreen(), type: Const.pageTransitionType);

      case RoutesName.introScreen:
        return PageTransition(
            child: const IntroScreen(), type: Const.pageTransitionType);

      // case RoutesName.introScreen4:
      //   return PageTransition(
      //       child: const Screen4(), type: Const.pageTransitionType);

      case RoutesName.signUp:
        return PageTransition(
            child: const SignupScreen(), type: Const.pageTransitionType);

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context)!.noRouteDefined),
            ),
          );
        });
    }
  }
}
