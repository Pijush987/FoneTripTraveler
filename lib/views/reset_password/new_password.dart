import 'dart:ui';
import 'package:traveler/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:traveler/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:traveler/views/profile/widget/custom_clip_path.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode conformNewPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    newPasswordFocusNode.dispose();
    conformNewPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // resizeToAvoidBottomInset: true,
          backgroundColor: ThemeConfig.whiteColor,

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
                                    AssetsPath.resetPassword,
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
                                    AppLocalizations.of(context)!.resetPassword,
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 90.h),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.enterNewPassword,
                            style: TextStyle(
                              fontFamily: Const.poppins,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              color: ThemeConfig.primaryColor,
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .yourNewPasswordMustBeDifferentFromPreviousUsedPasswords,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.enterNewPassword,
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                          ),
                        ),

                        // new password text field....
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            label: "*******",
                            keyboardType: TextInputType.text,
                            controller: newPasswordController,
                            focusNode: newPasswordFocusNode,
                            suffixIcon: IconButton(
                                iconSize: 25.r,
                                onPressed: () {
                                  context.read<ResetPasswordBloc>().add(
                                      PasswordVisible(
                                          !state.isPasswordVisible));
                                },
                                icon: !state.isPasswordVisible
                                    ? Icon(Icons.visibility_outlined)
                                    : Icon(Icons.visibility_off_outlined)),
                            obscureText: state.isPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseEnterAnPassword;
                              }
                              if (value.length < 8) {
                                return AppLocalizations.of(context)!
                                    .mustBeAtleast8Characters;
                              }
                              return null;
                            },
                            callbackAction: () {
                              newPasswordFocusNode.requestFocus();
                            },
                            onChange: (password) => context
                                .read<ResetPasswordBloc>()
                                .add(NewPasswordChange(password)),
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.confirmPassword,
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                          ),
                        ),

                        // confirm new password text field....
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            label: "*******",
                            keyboardType: TextInputType.emailAddress,
                            controller: confirmNewPasswordController,
                            focusNode: conformNewPasswordFocusNode,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseEnterAnPassword;
                              }
                              if (state.confirmNewPassword !=
                                  state.newPassword) {
                                return AppLocalizations.of(context)!
                                    .pleaseCheckYourPassword;
                              }
                              return null;
                            },
                            callbackAction: () {
                              conformNewPasswordFocusNode.requestFocus();
                            },
                            onChange: (password) => context
                                .read<ResetPasswordBloc>()
                                .add(ConfirmPasswordChange(password)),
                          ),
                        ),

                        SizedBox(height: 20.h),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomButton(
                            title: AppLocalizations.of(context)!.resetPassword,
                            width: 200.w,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
