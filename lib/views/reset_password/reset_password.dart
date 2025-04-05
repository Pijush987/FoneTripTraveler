import 'dart:ui';

import 'package:traveler/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/bloc/reset_password_bloc/reset_password_bloc.dart';

import '../profile/widget/custom_clip_path.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // resizeToAvoidBottomInset: true,
          backgroundColor: ThemeConfig.whiteColor,
          // appBar: AppBar(
          //   leading: Icon(Icons.arrow_back_ios),
          //   elevation: 0,
          //   backgroundColor: ThemeConfig.whiteColor,
          // ),
          body: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 260,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    AssetsPath.forgotPassword,
                                  ),
                                  fit: BoxFit.cover,
                                  invertColors: false),
                            ),
                          ),
                          Container(
                            height: 260,
                            color: const Color.fromARGB(129, 34, 57, 107)
                                .withValues(colorSpace: ColorSpace.displayP3),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_back_ios,
                                          color: ThemeConfig.whiteColor)),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .forgetPasswordfP,
                                    style: TextStyle(
                                      fontFamily: Const.poppins,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w800,
                                      color: ThemeConfig.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 90.h),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.mailAddressHere,
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 42),
                        child: Text(
                          AppLocalizations.of(context)!.enterEmail,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: Const.poppins,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeConfig.primaryColor,
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // email text field....
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTextFormField(
                          label:
                              AppLocalizations.of(context)!.john2018HotmailCom,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          focusNode: emailFocusNode,
                          prefixIcon: CustomExtendedImage(
                            height: 14.h,
                            imageUrl: AssetsPath.emailIcon,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .pleaseEnterAnEmail;
                            }
                            if (value.emailValidator()) {
                              return AppLocalizations.of(context)!
                                  .enterValidEmail;
                            }
                            return null;
                          },
                          callbackAction: () {
                            emailFocusNode.requestFocus();
                          },
                          onChange: (email) => context
                              .read<ResetPasswordBloc>()
                              .add(EmailChanged(email)),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.recoverPassword,
                          width: 180.w,
                          height: 32.h,
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
