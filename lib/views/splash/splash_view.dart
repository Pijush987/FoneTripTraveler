import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/services/splash/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    // Calls the [checkAuthentication] method from [SplashServices] to handle authentication logic
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeConfig.whiteColor,
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: CustomExtendedImage(
              width: ScreenUtil().screenWidth,
              height: 335.h,
              fit: BoxFit.cover,
              imageUrl: AssetsPath.mainScreen,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: CustomExtendedImage(
                  width: 600.w,
                  height: 130.h,
                  imageUrl: AssetsPath.foneTrip,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.itTimeTo.toUpperCase(),
                      style: TextStyle(
                        fontFamily: Const.poppins,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeConfig.primaryColor,
                      ),
                    ),
                    Text(
                      " ${AppLocalizations.of(context)!.explore.toUpperCase()}",
                      style: TextStyle(
                        fontFamily: Const.poppins,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeConfig.redClr1,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.theWorld.toUpperCase(),
                      style: TextStyle(
                        fontFamily: Const.poppins,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeConfig.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                title: AppLocalizations.of(context)!.exploreNow,
                width: 170.w,
                height: 30.h,
                borderRadios: 100.r,
                textStyle: TextStyle(
                  fontFamily: Const.poppins,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeConfig.whiteColor,
                ),
                onPress: () {
                  // Navigate to the login screen
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.introScreen, (route) => false);
                },
              ),
              SizedBox(
                width: 170.w,
                child: Text(
                  AppLocalizations.of(context)!.whereverYouWantToGo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: Const.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeConfig.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
