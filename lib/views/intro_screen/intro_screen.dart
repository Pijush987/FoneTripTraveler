import '../views.dart';
import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageController,
              children: [
                Intro1(),
                Intro2(),
                Intro3(),
              ],
            ),
            Positioned(
              right: 0,
              bottom: ScreenUtil().screenHeight / 2,
              left: 0,
              child: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: SlideEffect(
                    dotColor: ThemeConfig.primaryColor,
                    activeDotColor: ThemeConfig.redClr1,
                    paintStyle: PaintingStyle.fill,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: ScreenUtil().screenHeight * 0.17,
              left: 0,
              child: Center(
                child: CustomButton(
                  title: AppLocalizations.of(context)!.loginNow,
                  width: 200.w,
                  height: 32.h,
                  borderRadios: 100.r,
                  textStyle: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeConfig.whiteColor,
                  ),
                  onPress: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.login, (route) => false);
                  },
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: ScreenUtil().screenHeight * 0.1,
              left: 0,
              child: Center(
                child: CustomButton(
                  title: AppLocalizations.of(context)!.createAccount,
                  width: 200.w,
                  height: 32.h,
                  backgroundColor: ThemeConfig.whiteColor,
                  borderRadios: 100.r,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 186, 186, 186),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  textStyle: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeConfig.redClr1,
                  ),
                  onPress: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.signUp, (route) => false);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
