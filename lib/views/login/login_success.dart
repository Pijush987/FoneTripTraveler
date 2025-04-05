import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeConfig.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: CustomExtendedImage(
              height: 280.h,
              imageUrl: AssetsPath.phoneVerification,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 5.h),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                AppLocalizations.of(context)!.youHaveSuccessfullyLoggedIn,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: ThemeConfig.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              title: AppLocalizations.of(context)!.continueToExplore,
              width: 250.w,
              height: 32.h,
              borderRadios: 100.r,
              textStyle: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.whiteColor,
              ),
              onPress: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context, RoutesName.introScreen4, (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
