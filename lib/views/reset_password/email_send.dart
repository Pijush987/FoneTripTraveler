import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:traveler/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailSend extends StatefulWidget {
  const EmailSend({super.key});

  @override
  State<EmailSend> createState() => _EmailSendState();
}

class _EmailSendState extends State<EmailSend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeConfig.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        spacing: 8,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: CustomExtendedImage(
              height: 300.h,
              imageUrl: AssetsPath.sendEmail,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.checkYourMail,
              style: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: ThemeConfig.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 360.w,
            child: Text(
              AppLocalizations.of(context)!
                  .weHaveSentAsPasswordRecoverInstructionsToYourEmail,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              title: AppLocalizations.of(context)!.openEmailApp,
              width: 240.w,
              height: 32.h,
              borderRadios: 100.r,
              textStyle: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.whiteColor,
              ),
              onPress: () {},
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomTextButton(
              title: AppLocalizations.of(context)!.skipIllConfirmLater,
              width: 150.w,
              height: 30.h,
              textStyle: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: ThemeConfig.buttonTextColor1,
              ),
              onPress: () {
                // Navigate to the login screen
                // Navigator.pushNamed(context, Routes.login);
              },
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            AppLocalizations.of(context)!
                .didntReceiveTheEmailCheckYourSpamFilter,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ThemeConfig.buttonTextColor1,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.orTryAnotherEmailAddress,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ThemeConfig.primaryColor,
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
