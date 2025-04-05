import '../../utils/utils.dart';
import '../../configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // resizeToAvoidBottomInset: true,
          backgroundColor: ThemeConfig.whiteColor,
          body: Form(
            key: formKey,
            child: SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        padding:
                            EdgeInsets.only(top: 70.h, left: 40.w, right: 40.w),
                        child: CustomExtendedImage(
                          height: 250.h,
                          imageUrl: AssetsPath.signup,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        spacing: 20,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              AppLocalizations.of(context)!.createAccount,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Const.poppins,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: ThemeConfig.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          // user name text from field....
                          CustomTextFormField(
                            label: AppLocalizations.of(context)!.enterYourName,
                            controller: userController,
                            focusNode: userFocusNode,
                            keyboardType: TextInputType.text,
                            prefixIcon: CustomExtendedImage(
                              height: 14.h,
                              imageUrl: AssetsPath.personIcon,
                            ),
                            validatorText: state.isNameFieldEmpty,
                            callbackAction: () {
                              userFocusNode.requestFocus();
                            },
                            onChange: (text) => context
                                .read<SignupBloc>()
                                .add(TextChanged(text)),
                          ),

                          // email text from field....
                          CustomTextFormField(
                            label: AppLocalizations.of(context)!.enterYourEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            prefixIcon: CustomExtendedImage(
                              height: 14.h,
                              imageUrl: AssetsPath.emailIcon,
                            ),
                            validatorText: state.isEmailFieldEmpty,
                            callbackAction: () {
                              emailFocusNode.requestFocus();
                            },
                            onChange: (email) => context
                                .read<SignupBloc>()
                                .add(EmailChanged(email)),
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
                            sufixIcon: SizedBox(),
                            validatorText: state.isPhoneFieldEmpty,
                            callbackAction: () {
                              phoneFocusNode.requestFocus();
                            },
                            callbackCountryCode: () async {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.focusedChild?.unfocus();
                              }
                              final picked = await Const.countryPicker
                                  .showPicker(context: context);
                              context
                                  .read<SignupBloc>()
                                  .add(CountryCodeChange(picked!.dialCode));
                            },
                            onChange: (phoneNo) => context
                                .read<SignupBloc>()
                                .add(PhoneNoChanged(phoneNo)),
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
                                .read<SignupBloc>()
                                .add(PasswordChanged(password)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomButton(
                              title: AppLocalizations.of(context)!.signUp,
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
                                onSigninButtonPress();
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

  void onSigninButtonPress() {
    if (userController.text.isEmpty) {
      context.read<SignupBloc>().add(EmptyFieldName(true));
      return;
    } else {
      context.read<SignupBloc>().add(EmptyFieldName(false));
    }

    if (emailController.text.isEmpty) {
      context.read<SignupBloc>().add(EmptyFieldEmail(true));
      return;
    } else {
      context.read<SignupBloc>().add(EmptyFieldEmail(false));
    }

    if (phoneController.text.isEmpty) {
      context.read<SignupBloc>().add(EmptyFieldPhone(true));
      return;
    } else {
      context.read<SignupBloc>().add(EmptyFieldPhone(false));
    }

    if (passwordController.text.isEmpty) {
      context.read<SignupBloc>().add(EmptyFieldPassword(true));
      return;
    } else {
      context.read<SignupBloc>().add(EmptyFieldPassword(false));
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
