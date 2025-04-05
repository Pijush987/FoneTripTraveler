import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:traveler/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final FocusNode userFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  final TextEditingController phoneController = TextEditingController();
  final FocusNode phoneFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    userFocusNode.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    phoneController.dispose();
    phoneFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: ThemeConfig.whiteColor,
          body: SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15.h,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomExtendedImage(
                          height: 300.h,
                          imageUrl: AssetsPath.login,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        spacing: 20,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // email text from field....
                          CustomTextFormField(
                            label: AppLocalizations.of(context)!.enterYourEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            prefixIcon: CustomExtendedImage(
                              height: 14.h,
                              imageUrl: AssetsPath.personIcon,
                            ),
                            validatorText: state.isEmailFieldEmpty,
                            callbackAction: () {
                              emailFocusNode.requestFocus();
                            },
                            onChange: (email) => context
                                .read<LoginBloc>()
                                .add(LoginEmailChanged(email)),
                          ),

                          // phone number text from field....
                          CustomCountruCodePickerTextField(
                            label:
                                AppLocalizations.of(context)!.enterMobileNumber,
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            focusNode: phoneFocusNode,
                            prefixIcon: CustomExtendedImage(
                              height: 14.h,
                              imageUrl: AssetsPath.phoneIcon,
                            ),
                            validatorText: state.isPhoneFieldEmpty,
                            callbackAction: () {
                              phoneFocusNode.requestFocus();
                            },
                            sufixIcon: SizedBox(),
                            callbackCountryCode: () async {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.focusedChild?.unfocus();
                              }
                              final picked = await Const.countryPicker
                                  .showPicker(context: context);
                              context.read<LoginBloc>().add(
                                  LoginCountryCodeChange(picked!.dialCode));
                            },
                            onChange: (phoneNo) => context
                                .read<LoginBloc>()
                                .add(LoginPhoneNoChanged(phoneNo)),
                            countryCode: state.countryCode,
                          ),

                          // password text from field....
                          CustomTextFormField(
                            label: AppLocalizations.of(context)!.enterPassword,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            prefixIcon: CustomExtendedImage(
                              height: 14.h,
                              imageUrl: AssetsPath.passwordIcon,
                            ),
                            validatorText: state.isPasswordFieldEmpty,
                            callbackAction: () {
                              passwordFocusNode.requestFocus();
                            },
                            onChange: (password) => context
                                .read<LoginBloc>()
                                .add(LoginPasswordChanged(password)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FlutterSwitch(
                                    width: 40.0.w,
                                    height: 18.0.h,
                                    valueFontSize: 0.0,
                                    toggleSize: 15.0,
                                    activeColor: ThemeConfig.primaryColor,
                                    value: state.isRememberPassword,
                                    padding: 2.0,
                                    onToggle: (val) {
                                      context
                                          .read<LoginBloc>()
                                          .add(RememberPassword(val));
                                    },
                                  ),
                                  SizedBox(width: 8),
                                  InkWell(
                                    splashColor: ThemeConfig.transparent,
                                    highlightColor: ThemeConfig.transparent,
                                    hoverColor: ThemeConfig.transparent,
                                    focusColor: ThemeConfig.transparent,
                                    onTap: () {},
                                    child: Text(
                                      AppLocalizations.of(context)!.rememberMe,
                                      style: TextStyle(
                                        fontFamily: Const.poppins,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: ThemeConfig.primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                splashColor: ThemeConfig.transparent,
                                highlightColor: ThemeConfig.transparent,
                                hoverColor: ThemeConfig.transparent,
                                focusColor: ThemeConfig.transparent,
                                onTap: () {},
                                child: Text(
                                  AppLocalizations.of(context)!.forgetPassword,
                                  style: TextStyle(
                                    fontFamily: Const.poppins,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConfig.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomButton(
                              title: AppLocalizations.of(context)!.login,
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
                                onLoginButtonPressed();
                              },
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
        );
      },
    );
  }

  void onLoginButtonPressed() {
    if (emailController.text.isEmpty) {
      context.read<LoginBloc>().add(EmptyFieldEmail(true));
      return;
    } else {
      context.read<LoginBloc>().add(EmptyFieldEmail(false));
    }

    if (phoneController.text.isEmpty) {
      context.read<LoginBloc>().add(EmptyFieldPhone(true));
      return;
    } else {
      context.read<LoginBloc>().add(EmptyFieldPhone(false));
    }

    if (passwordController.text.isEmpty) {
      context.read<LoginBloc>().add(EmptyFieldPassword(true));
      return;
    } else {
      context.read<LoginBloc>().add(EmptyFieldPassword(false));
    }

    if (!emailController.text.emailValidator()) {
      final snackBar = snackBars(AppLocalizations.of(context)!.enterValidEmail);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (!phoneController.text.pinValidator()) {
      final snackBar =
          snackBars(AppLocalizations.of(context)!.enterValidPhoneNumber);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      print("Validation Success");
    }
  }

  SnackBar snackBars(String message) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: Const.poppins,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: ThemeConfig.whiteColor,
        ),
      ),
      duration: const Duration(milliseconds: 500),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
  }
}
