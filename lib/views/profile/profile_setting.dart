import 'dart:ui';

import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/views/profile/widget/custom_clip_path.dart';

import 'widget/custom_progress_indicator.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  List<String> drawerItems = const [
    "Language",
    "My Booking History",
    "Notification",
    "Change password",
    "Privacy",
    "Terms of use",
    "Log Out",
  ];
  List<String> drawerIcons = [
    AssetsPath.language,
    AssetsPath.bookingHistory,
    AssetsPath.notification,
    AssetsPath.changePassword,
    AssetsPath.privacy,
    AssetsPath.trams,
    AssetsPath.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          const Color.fromARGB(55, 0, 9, 41)
                              .withValues(colorSpace: ColorSpace.displayP3),
                          BlendMode.darken),
                      image: AssetImage(
                        AssetsPath.profileSetting,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 170,
                child: Container(
                  height: 130.w,
                  width: 130.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: ThemeConfig.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 3,
                          spreadRadius: 0.5,
                          color: Color.fromRGBO(0, 0, 0, 0.125),
                        )
                      ]),
                  child: Center(
                    child: CustomExtendedImage(
                      height: 120.w,
                      width: 120.w,
                      fit: BoxFit.fill,
                      imageUrl: AssetsPath.userImg,
                      borderRadius: BorderRadius.circular(100.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),
          Text(
            AppLocalizations.of(context)!.johnDoe,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ThemeConfig.primaryColor,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            AppLocalizations.of(context)!.editProfile,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: ThemeConfig.redClr1,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomProgressIndicator(
                  size: 130.w,
                  progress: 0.7,
                  backgroundColor: Color(0xFFE3E7EC),
                  progressColor: Color(0xFF1E3A5F),
                  thumbColor: Colors.white,
                  thickness: 12,
                ),
                const SizedBox(height: 10),
                Text(
                  "${AppLocalizations.of(context)!.profileCompletion} ${70}% ${AppLocalizations.of(context)!.completeIt}",
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeConfig.secondaryTextColor,
                  ),
                ),
                CustomTextButton(
                  padding: EdgeInsets.all(2),
                  title: AppLocalizations.of(context)!.completeNow,
                  width: 200.w,
                  height: 20.h,
                  textStyle: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeConfig.primaryColor,
                  ),
                  onPress: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, RoutesName.introScreen4, (route) => false);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.h),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              decoration: BoxDecoration(
                color: ThemeConfig.colorF2F2F2CC,
                borderRadius: BorderRadius.circular(12),
              ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 22.w,
                              width: 22.w,
                              decoration: BoxDecoration(
                                  color: ThemeConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(24)),
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
    );
  }
}
