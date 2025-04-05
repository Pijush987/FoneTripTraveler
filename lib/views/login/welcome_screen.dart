import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/views/login/widgets/notification_dialog.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              imageUrl: AssetsPath.welcome,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 40.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppLocalizations.of(context)!.oneLastThing,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: ThemeConfig.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppLocalizations.of(context)!.marketingPermission,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeConfig.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppLocalizations.of(context)!.noPrivateData,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeConfig.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              title: AppLocalizations.of(context)!.continueIt,
              width: 180.w,
              height: 32.h,
              borderRadios: 100.r,
              textStyle: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.whiteColor,
              ),
              onPress: () {
                showNotificationDialog(context);

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
