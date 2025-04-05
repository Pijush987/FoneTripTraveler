import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import '../login/widgets/background_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/views/review/widget/rating_widget.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: true,
      backgroundColor: ThemeConfig.whiteColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Backgroundimg(
                content: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.myReview,
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w800,
                          color: ThemeConfig.whiteColor,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.whatMyClientSaidAboutMe,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeConfig.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 280.h),
                  height: 120.h,
                  width: 120.h,
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
                          height: 110.w,
                          width: 110.w,
                          fit: BoxFit.fill,
                          imageUrl: AssetsPath.userImg,
                          borderRadius: BorderRadius.circular(100.w),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                Text(
                  "Roxanne Milla",
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: ThemeConfig.primaryColor,
                  ),
                ),
                SizedBox(height: 5.w),
                Center(child: RatingWidget(rating: 4.6)),
                SizedBox(height: 10.w),
                Text(
                  "4.7/5 (100 Reviews)",
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeConfig.primaryColor,
                  ),
                ),
                SizedBox(height: 20.w),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Const.poppins,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: ThemeConfig.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 60.w),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    title: AppLocalizations.of(context)!.viewAll,
                    width: 180.w,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
