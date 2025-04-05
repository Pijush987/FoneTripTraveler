import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/views/review/widget/rating_widget.dart';

class MyReview extends StatefulWidget {
  const MyReview({super.key});

  @override
  State<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AppLocalizations.of(context)!.myReview,
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
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ThemeConfig.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 3,
                    color: Color.fromRGBO(0, 0, 0, 0.125),
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            borderRadius: BorderRadius.circular(100.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jac Calear",
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                        SizedBox(height: 5.w),
                        RatingWidget(rating: 4),
                        SizedBox(height: 5.w),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry....",
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
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox();
          },
          itemCount: 6),
    );
  }
}
