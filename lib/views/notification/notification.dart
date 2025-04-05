import 'package:flutter/cupertino.dart';
import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import '../../configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
          AppLocalizations.of(context)!.notifications,
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
      body: ListView.separated(
        itemBuilder: (_, index) {
          return Container(
            padding: EdgeInsets.all(18.r),
            decoration: BoxDecoration(
              color: ThemeConfig.whiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 7,
                  spreadRadius: 8,
                  color: Color.fromRGBO(61, 61, 61, 0.157),
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 100.w,
                  width: 100.w,
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
                      height: 90.w,
                      width: 90.w,
                      fit: BoxFit.fill,
                      imageUrl: AssetsPath.userImg,
                      borderRadius: BorderRadius.circular(100.w),
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Pijush Rana",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                    color: ThemeConfig.primaryColor,
                                  ),
                                ),
                                Text(
                                  "${AppLocalizations.of(context)!.bookingId} #4534534",
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConfig.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                              alignment: Alignment.center,
                              height: 35.w,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  color: ThemeConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(28)),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                CupertinoIcons.checkmark_alt,
                                color: ThemeConfig.whiteColor,
                              )),
                          SizedBox(width: 6),
                          Container(
                              alignment: Alignment.center,
                              height: 35.w,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  color: ThemeConfig.redClr2,
                                  borderRadius: BorderRadius.circular(28)),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                CupertinoIcons.clear,
                                color: ThemeConfig.whiteColor,
                              )),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          CustomExtendedImage(
                            height: 32.w,
                            width: 32.w,
                            fit: BoxFit.fill,
                            imageUrl: AssetsPath.scheduleDate,
                            borderRadius: BorderRadius.circular(100.w),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.scheduleDate,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeConfig.blackColor,
                                  ),
                                ),
                                Text(
                                  "${AppLocalizations.of(context)!.bookingId}#4534534",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConfig.textColorBEBEBE,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomExtendedImage(
                            height: 32.w,
                            width: 32.w,
                            fit: BoxFit.fill,
                            imageUrl: AssetsPath.location,
                            borderRadius: BorderRadius.circular(100.w),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.desiredLocation,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeConfig.blackColor,
                                  ),
                                ),
                                Text(
                                  "${AppLocalizations.of(context)!.bookingId}#465673 ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConfig.textColorBEBEBE,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, index) {
          return SizedBox();
        },
        itemCount: 3,
      ),
      floatingActionButton: FloatingActionButton.extended(
          foregroundColor: ThemeConfig.whiteColor,
          elevation: 0,
          onPressed: () {},
          label: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  title: AppLocalizations.of(context)!.viewAllBookings,
                  width: 220.w,
                  height: 32.h,
                  borderRadios: 100.r,
                  textStyle: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeConfig.whiteColor,
                  ),
                  onPress: () {
                    // if (formKey.currentState!.validate()) {}
                  },
                ),
              ),
            ],
          )),
    );
  }
}
