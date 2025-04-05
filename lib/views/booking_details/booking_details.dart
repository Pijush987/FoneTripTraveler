import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  List<String> tags = ["Netbanking", "Promo Applied"];
  List<String> invoiceList = ["Netbanking", "Discount", "Paid Amount"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.primaryColor,
      extendBodyBehindAppBar: true,
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
              child: Icon(Icons.arrow_back_ios, color: ThemeConfig.whiteColor)),
        ),
        centerTitle: true,
        foregroundColor: ThemeConfig.primaryColor,
        backgroundColor: ThemeConfig.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18, right: 18, bottom: 24, top: 55),
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          color: ThemeConfig.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.only(
                      left: 18.w, right: 18.w, top: 26.w, bottom: 8.w),
                  child: Row(
                    children: [
                      Container(
                        height: 90.w,
                        width: 90.w,
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
                                height: 80.w,
                                width: 80.w,
                                fit: BoxFit.fill,
                                imageUrl: AssetsPath.userImg,
                                borderRadius: BorderRadius.circular(100.w),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.h),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6.h,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    AppLocalizations.of(context)!.jayClarke,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: Const.poppins,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                      color: ThemeConfig.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.h),
                                Text(
                                  "\$25.00",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800,
                                    color: ThemeConfig.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${AppLocalizations.of(context)!.bookingId} #4534534",
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                            Row(
                              spacing: 5,
                              children: List.generate(tags.length, (ind) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: ThemeConfig.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Text(
                                    tags[ind],
                                    style: TextStyle(
                                      fontFamily: Const.poppins,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeConfig.whiteColor,
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.3.w,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 38.w, vertical: 13.w),
                  child: Row(
                    children: [
                      CustomExtendedImage(
                        height: 40.w,
                        width: 40.w,
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                            Text(
                              "${AppLocalizations.of(context)!.bookingId}#4534534",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.textColorBEBEBE,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.3.w,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 38.w, vertical: 13.w),
                  child: Row(
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
                      SizedBox(width: 5),
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                            Text(
                              "${AppLocalizations.of(context)!.bookingId}#465673 ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.textColorBEBEBE,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.3.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.noted,
                    style: TextStyle(
                      fontFamily: Const.poppins,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeConfig.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4),
                  child: Text(
                    AppLocalizations.of(context)!.loremIpsum,
                    style: TextStyle(
                      fontFamily: Const.poppins,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: ThemeConfig.primaryColor,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.3.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4),
                  child: Text(
                    AppLocalizations.of(context)!.tripFare,
                    style: TextStyle(
                      fontFamily: Const.poppins,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeConfig.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          AppLocalizations.of(context)!.netbanking,
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "@25.00",
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          AppLocalizations.of(context)!.discount,
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "@25.00",
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          AppLocalizations.of(context)!.paidAmount,
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "@25.00",
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ThemeConfig.transparent,
          elevation: 0,
          onPressed: null,
          label: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  backgroundColor: ThemeConfig.redClr3,
                  title: AppLocalizations.of(context)!.cancel,
                  width: 170.w,
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
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  title: AppLocalizations.of(context)!.accept,
                  width: 170.w,
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
              SizedBox(height: 40.h),
            ],
          )),
    );
  }
}
