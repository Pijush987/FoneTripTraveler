import '../views.dart';
import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  final List<String> information = [
    "Username",
    "Phone Number",
    "Email",
    "Gender",
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
              _key.currentState!.openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: SvgImageWidget(
                svgPath: AssetsPath.drawer,
              ),
            ),
          ),
          actions: [
            CustomTextButton(
              padding: EdgeInsets.only(right: 15.w),
              title: AppLocalizations.of(context)!.edit,
              textStyle: TextStyle(
                fontFamily: Const.poppins,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ThemeConfig.primaryColor,
              ),
              onPress: () {},
            ),
          ],
          foregroundColor: ThemeConfig.whiteColor,
          backgroundColor: ThemeConfig.whiteColor,
        ),
        drawer: DrawerWidget(),
        body: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),
              Container(
                height: 150.w,
                width: 150.w,
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
                    imageUrl: AssetsPath.bookingHistory,
                    borderRadius: BorderRadius.circular(100.w),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.roxanneMilla,
                style: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: ThemeConfig.primaryColor,
                ),
              ),
              SizedBox(height: 30.h),
              Divider(
                color: ThemeConfig.primaryColor,
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                height: 50.h,
                color: ThemeConfig.color1F1F1,
                child: Text(
                  AppLocalizations.of(context)!.information,
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeConfig.textColor5C5C5C,
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, ind) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          information[ind],
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              information[ind],
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: ThemeConfig.dividerColor,
                              size: 17,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, ind) {
                  return Divider(
                    color: ThemeConfig.dividerColor,
                    height: 0.3.h,
                  );
                },
                itemCount: information.length,
              ),
              Divider(
                color: ThemeConfig.dividerColor,
                height: 2.h,
              ),
            ],
          ),
        ));
  }
}
