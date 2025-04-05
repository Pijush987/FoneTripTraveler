import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupMain extends StatelessWidget {
  const SignupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeConfig.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            AppLocalizations.of(context)!.welcomeToFonetrip,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: ThemeConfig.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              AppLocalizations.of(context)!.pleaseLoginOrSignup,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 50.h, left: 10.w, right: 10.w, bottom: 50.w),
            child: CustomExtendedImage(
              height: 350.h,
              imageUrl: AssetsPath.signupMain,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.orLoginWithEmail,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ThemeConfig.primaryColor,
            ),
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              title: AppLocalizations.of(context)!.signUp,
              width: 160.w,
              height: 32.h,
              borderRadios: 100.r,
              textStyle: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.whiteColor,
              ),
              onPress: () {
                // Navigate to the login screen
                // Navigator.pushNamed(context, Routes.login);
              },
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.alreadyHaveAnAccount,
                style: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeConfig.primaryColor,
                ),
              ),
              CustomTextButton(
                title: AppLocalizations.of(context)!.login,
                width: 150.w,
                height: 30.h,
                textStyle: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeConfig.textColor4,
                ),
                onPress: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
