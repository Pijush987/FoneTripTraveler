import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/configs/components/pin_input_widget.dart';
import 'package:traveler/bloc/phone_number_verify_bloc/phone_number_verify_bloc.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController inputCodeController = TextEditingController();
  final FocusNode inputCodeFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    inputCodeController.dispose();
    inputCodeFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberVerifyBloc, PhoneNumberVerifyState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // resizeToAvoidBottomInset: true,
          backgroundColor: ThemeConfig.whiteColor,
          body: Form(
            key: formKey,
            child: Column(
              spacing: 15.h,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: ThemeConfig.transparent,
                        highlightColor: ThemeConfig.transparent,
                        hoverColor: ThemeConfig.transparent,
                        focusColor: ThemeConfig.transparent,
                        onTap: () {
                          // Remove TextField Focus
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.focusedChild?.unfocus();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 100.h, left: 40.w, right: 40.w),
                          child: CustomExtendedImage(
                            height: 100.h,
                            imageUrl: AssetsPath.otp,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        AppLocalizations.of(context)!.otpVerification,
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeConfig.primaryColor,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.enterOtp,
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeConfig.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // verification code field....
                      PinInputWidget(
                        controller: inputCodeController,
                        focusNode: inputCodeFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseEnterAnEmail;
                          }
                          if (value.length != 4) {
                            return AppLocalizations.of(context)!
                                .codeShouldbe4Digit;
                          }
                          if (value.pinValidator()) {
                            return AppLocalizations.of(context)!
                                .codeIsNotCorrect;
                          }
                          if (value.emailValidator()) {
                            return AppLocalizations.of(context)!
                                .enterValidEmail;
                          }
                          return null;
                        },
                        onChange: (input) => context
                            .read<PhoneNumberVerifyBloc>()
                            .add(OtpCodeChange(input)),
                      ),
                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.submit,
                          width: 180.w,
                          height: 36.h,
                          borderRadios: 100.r,
                          textStyle: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeConfig.whiteColor,
                          ),
                          onPress: () {
                            if (formKey.currentState!.validate()) {}
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "${AppLocalizations.of(context)!.validateCode} + 91 ${9087676545}",
                        style: TextStyle(
                          fontFamily: Const.poppins,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: ThemeConfig.primaryColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.ifNot,
                            style: TextStyle(
                              fontFamily: Const.poppins,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeConfig.primaryColor,
                            ),
                          ),
                          CustomTextButton(
                            title: AppLocalizations.of(context)!.resend,
                            width: 140.w,
                            height: 20.h,
                            textStyle: TextStyle(
                              fontFamily: Const.poppins,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: ThemeConfig.textColoryellow,
                            ),
                            onPress: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
