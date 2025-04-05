import '../../utils/utils.dart';
import '../configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCountruCodePickerTextField extends StatelessWidget {
  final String label;
  final double? height;
  final String countryCode;
  final bool obscureText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? callbackAction;
  final GestureTapCallback? callbackCountryCode;
  final GestureTapCallback? verifyPhoneNoCallBack;
  final String? Function(String?)? validator;
  final bool validatorText;
  final Widget? sufixIcon;

  const CustomCountruCodePickerTextField({
    super.key,
    this.height,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.countryCode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.onChange,
    this.validator,
    this.contentPadding,
    this.prefixIcon,
    this.sufixIcon,
    this.callbackAction,
    this.callbackCountryCode,
    this.verifyPhoneNoCallBack,
    this.obscureText = false,
    this.validatorText = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ThemeConfig.transparent,
      highlightColor: ThemeConfig.transparent,
      hoverColor: ThemeConfig.transparent,
      focusColor: ThemeConfig.transparent,
      onTap: callbackAction,
      child: Container(
        height: height ?? Const.textFieldHight,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: ThemeConfig.textFieldBGColor,
          border: Border.all(
              color:
                  validatorText ? ThemeConfig.redClr1 : ThemeConfig.transparent,
              width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: focusNode,
                cursorColor: ThemeConfig.primaryColor,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp,
                      color: ThemeConfig.primaryColor,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                    ),
                controller: controller,
                maxLength: 10,
                obscureText: obscureText,
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: contentPadding ??
                      EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                  prefixIconConstraints: BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 100,
                      minHeight: 50,
                      minWidth: 85),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      prefixIcon ?? SizedBox(),
                      SizedBox(width: 10),
                      InkWell(
                        splashColor: ThemeConfig.transparent,
                        highlightColor: ThemeConfig.transparent,
                        hoverColor: ThemeConfig.transparent,
                        focusColor: ThemeConfig.transparent,
                        onTap: callbackCountryCode,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.r),
                          child: Row(
                            children: [
                              Text(
                                countryCode,
                                style: TextStyle(
                                  fontFamily: Const.poppins,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeConfig.primaryColor,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  hintText: label,
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp,
                      color: ThemeConfig.primaryColor,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: ThemeConfig.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: ThemeConfig.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: ThemeConfig.transparent)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: ThemeConfig.transparent)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: ThemeConfig.transparent)),
                ),
                keyboardType: keyboardType,
                onFieldSubmitted: onFieldSubmitted,
                onChanged: onChange,
                validator: validator,
                textInputAction: textInputAction,
              ),
            ),
            sufixIcon ??
                InkWell(
                  splashColor: ThemeConfig.transparent,
                  highlightColor: ThemeConfig.transparent,
                  hoverColor: ThemeConfig.transparent,
                  focusColor: ThemeConfig.transparent,
                  onTap: verifyPhoneNoCallBack,
                  child: Text(
                    AppLocalizations.of(context)!.verifyPhoneNumber,
                    style: TextStyle(
                      fontFamily: Const.poppins,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: ThemeConfig.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ),
    );
  }
}
