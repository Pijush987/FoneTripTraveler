import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40.w,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.myWallet,
          style: TextStyle(
            fontFamily: Const.poppins,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            color: ThemeConfig.whiteColor,
          ),
        ),
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
              child: Icon(Icons.arrow_back_ios, color: ThemeConfig.whiteColor)),
        ),
        foregroundColor: ThemeConfig.primaryColor,
        backgroundColor: ThemeConfig.primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 315,
                color: ThemeConfig.primaryColor,
              ),
              Container(
                height: ScreenUtil().screenHeight / 2.35,
                color: ThemeConfig.whiteColor,
              ),
            ],
          ),
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              children: [
                SizedBox(height: 110.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ThemeConfig.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.r),
                              bottomLeft: Radius.circular(4.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                                color: Color.fromRGBO(0, 0, 0, 0.125),
                              )
                            ],
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.cash,
                            style: TextStyle(
                              fontFamily: Const.poppins,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeConfig.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ThemeConfig.whiteColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.r),
                              bottomRight: Radius.circular(4.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 3,
                                spreadRadius: 0.5,
                                color: Color.fromRGBO(0, 0, 0, 0.125),
                              )
                            ],
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.discount,
                            style: TextStyle(
                              fontFamily: Const.poppins,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeConfig.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  AppLocalizations.of(context)!.totalEarn,
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeConfig.whiteColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "\$ 350.00",
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeConfig.whiteColor,
                  ),
                ),
                SizedBox(height: 25.h),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ThemeConfig.whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                        color: Color.fromRGBO(0, 0, 0, 0.125),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ThemeConfig.redClr3,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                            bottomLeft: Radius.circular(30.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "\$",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: Const.poppins,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600,
                              color: ThemeConfig.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.paymentMethod,
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeConfig.primaryColor,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: ThemeConfig.secondaryTextColor),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.paymentHistory,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: Const.poppins,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeConfig.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30.w,
                            ),
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55.h,
                                  width: 55.h,
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
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CustomExtendedImage(
                                          height: 45.w,
                                          width: 45.w,
                                          fit: BoxFit.fill,
                                          imageUrl: AssetsPath.userImg,
                                          borderRadius:
                                              BorderRadius.circular(100.w),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)!.customerName}Jac Calear",
                                        style: TextStyle(
                                          fontFamily: Const.poppins,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeConfig.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        "${AppLocalizations.of(context)!.bookingId}#762157e6",
                                        style: TextStyle(
                                          fontFamily: Const.poppins,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ThemeConfig.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        "Louvre Museum, France, Paris",
                                        style: TextStyle(
                                          fontFamily: Const.poppins,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ThemeConfig.textColorBEBEBE,
                                        ),
                                      ),
                                      Text(
                                        "\$25.00",
                                        style: TextStyle(
                                          fontFamily: Const.poppins,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeConfig.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 2.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ThemeConfig.redClr3,
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "oct.",
                                            style: TextStyle(
                                              fontFamily: Const.poppins,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: ThemeConfig.whiteColor,
                                            ),
                                          ),
                                          Text(
                                            "11",
                                            style: TextStyle(
                                              fontFamily: Const.poppins,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: ThemeConfig.whiteColor,
                                            ),
                                          ),
                                          Text(
                                            "2024",
                                            style: TextStyle(
                                              fontFamily: Const.poppins,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: ThemeConfig.whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(height: 10.h);
                        },
                        itemCount: 5))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
