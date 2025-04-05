import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: CustomExtendedImage(
            height: 350.h,
            imageUrl: AssetsPath.introImg2,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Text(
              AppLocalizations.of(context)!.simpleHandlingOfTravelExpenses,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: ThemeConfig.primaryColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            AppLocalizations.of(context)!.noMoreDisputes,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: ThemeConfig.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
