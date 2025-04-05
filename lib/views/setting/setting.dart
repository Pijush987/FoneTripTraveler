import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final List<String> information = [
    "Reviews",
    "Language",
    "Notifications",
    "Terms & Privacy Policy",
    "Contact Us"
  ];
  List<String> drawerIcons = [
    AssetsPath.review,
    AssetsPath.language,
    AssetsPath.notificationBell,
    AssetsPath.notification,
    AssetsPath.notification,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ThemeConfig.whiteColor,
        key: _key, // Assign the key to Scaffold.
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 40.w,
          leading: InkWell(
            splashColor: ThemeConfig.transparent,
            highlightColor: ThemeConfig.transparent,
            hoverColor: ThemeConfig.transparent,
            focusColor: ThemeConfig.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Icon(Icons.arrow_back_ios)),
          ),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.settings,
            style: TextStyle(
              fontFamily: Const.poppins,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: ThemeConfig.primaryColor,
            ),
          ),
          foregroundColor: ThemeConfig.whiteColor,
          backgroundColor: ThemeConfig.whiteColor,
        ),
        body: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              SizedBox(height: 50.h),
              Container(
                padding: EdgeInsets.all(22.r),
                height: 180.h,
                color: ThemeConfig.primaryColor,
                child: Row(
                  children: [
                    Container(
                      height: 120.w,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: ThemeConfig.whiteColor,
                      ),
                      child: Center(
                        child: CustomExtendedImage(
                          height: 110.w,
                          width: 110.w,
                          fit: BoxFit.fill,
                          imageUrl: AssetsPath.userImg,
                          borderRadius: BorderRadius.circular(100.w),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
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
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, ind) {
                  return Container(
                    color: ThemeConfig.textFieldBGColor,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 28.w,
                              width: 28.w,
                              decoration: BoxDecoration(
                                  color: ThemeConfig.redClr1,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.all(4),
                              child: SvgImageWidget(
                                hight: 15.w,
                                width: 15.w,
                                svgPath: drawerIcons[ind],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              information[ind],
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.iconColor1,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ThemeConfig.iconColor1,
                          size: 22,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, ind) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: information.length,
              ),
            ],
          ),
        ));
  }
}
