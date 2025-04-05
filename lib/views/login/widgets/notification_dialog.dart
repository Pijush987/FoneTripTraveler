import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/configs.dart';
import '../../../utils/utils.dart';

void showNotificationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ThemeConfig.colorF2F2F2CC,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.fonetripNotifications,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: ThemeConfig.primaryColor,
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(top: 10.h, bottom: 20.h),
        actionsPadding: EdgeInsets.zero,
        content: Text(
          AppLocalizations.of(context)!.notificationDetails,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: Const.poppins,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: ThemeConfig.primaryColor,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween, // Align buttons
        actions: [
          Divider(
            height: 1,
            thickness: 1.4,
            color: ThemeConfig.dividerColor,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      title: AppLocalizations.of(context)!.dontAllow,
                      height: 32.h,
                      backgroundColor: ThemeConfig.colorF2F2F2CC,
                      borderColor: ThemeConfig.colorF2F2F2CC,
                      borderRadios: 0.r,
                      textStyle: TextStyle(
                        fontFamily: Const.poppins,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeConfig.primaryColor,
                      ),
                      onPress: () {
                        showNotificationDialog(context);

                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, RoutesName.introScreen4, (route) => false);
                      },
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1.4,
                  color: ThemeConfig.dividerColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      title: AppLocalizations.of(context)!.allow,
                      backgroundColor: ThemeConfig.colorF2F2F2CC,
                      borderColor: ThemeConfig.colorF2F2F2CC,
                      height: 32.h,
                      borderRadios: 0.r,
                      textStyle: TextStyle(
                        fontFamily: Const.poppins,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: ThemeConfig.primaryColor,
                      ),
                      onPress: () {
                        showNotificationDialog(context);

                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, RoutesName.introScreen4, (route) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
