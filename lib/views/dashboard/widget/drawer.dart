import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    List<String> drawerItems = const [
      "Language",
      "My Booking History",
      "Notification",
      "Change password",
      "Settings",
      "My Wallet",
      "Privacy",
      "Terms of use",
      "Log Out",
    ];
    List<String> drawerIcons = [
      AssetsPath.language,
      AssetsPath.bookingHistory,
      AssetsPath.notification,
      AssetsPath.changePassword,
      AssetsPath.setting,
      AssetsPath.myWallet,
      AssetsPath.privacy,
      AssetsPath.trams,
      AssetsPath.logout,
    ];

    return Container(
      margin: EdgeInsets.only(top: height),
      height: ScreenUtil().screenHeight,
      width: 250.h,
      color: ThemeConfig.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.r),
                  height: 200.h,
                  width: 250.h,
                  color: ThemeConfig.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.roxanneMilla,
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          color: ThemeConfig.whiteColor,
                        ),
                      ),
                      Text(
                        "${AppLocalizations.of(context)!.foneTripId}#4534534",
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeConfig.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 80.h),
                    color: ThemeConfig.whiteColor,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, ind) {
                        return InkWell(
                          splashColor: ThemeConfig.transparent,
                          highlightColor: ThemeConfig.transparent,
                          hoverColor: ThemeConfig.transparent,
                          focusColor: ThemeConfig.transparent,
                          onTap: () {},
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 22.w,
                                    width: 22.w,
                                    decoration: BoxDecoration(
                                        color: ThemeConfig.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    padding: EdgeInsets.all(4),
                                    child: SvgImageWidget(
                                      hight: 15.w,
                                      width: 15.w,
                                      svgPath: drawerIcons[ind],
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    drawerItems[ind],
                                    style: TextStyle(
                                      fontFamily: Const.poppins,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeConfig.primaryColor,
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (_, ind) {
                        return SizedBox();
                      },
                      itemCount: drawerItems.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            color: ThemeConfig.dividerColor,
            height: 40.w,
            width: 40.w,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.clear,
                  color: ThemeConfig.primaryColor,
                )),
          )
        ],
      ),
    );
  }
}
