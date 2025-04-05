import '../../utils/utils.dart';
import '../configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Custom TextFormField Widget
class CustomTextFormField extends StatelessWidget {
  final double? height;
  final String label;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;
  final bool validatorText;
  final GestureTapCallback? callbackAction;
  final GestureTapCallback? suffixIconCallbackAction;

  const CustomTextFormField({
    super.key,
    this.height,
    required this.label,
    required this.controller,
    required this.focusNode,
    this.contentPadding,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.onChange,
    this.validatorText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.callbackAction,
    this.suffixIconCallbackAction,
    this.obscureText = false,
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
        child: TextFormField(
            focusNode: focusNode,
            cursorColor: ThemeConfig.primaryColor,
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 11,
                  fontFamily: Const.poppins,
                  color: ThemeConfig.primaryColor,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  decorationThickness: 0,
                ),
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: contentPadding ??
                  EdgeInsets.only(top: 0.h, left: 10.w, right: 10.w),
              prefixIconConstraints: BoxConstraints(
                  maxHeight: 50, maxWidth: 50, minHeight: 20, minWidth: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: prefixIcon,
              ),
              suffixIconConstraints: BoxConstraints(
                  maxHeight: 50, maxWidth: 50, minHeight: 20, minWidth: 20),
              suffixIcon: InkWell(
                splashColor: ThemeConfig.transparent,
                highlightColor: ThemeConfig.transparent,
                hoverColor: ThemeConfig.transparent,
                focusColor: ThemeConfig.transparent,
                onTap: suffixIconCallbackAction,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: suffixIcon,
                ),
              ),
              hintText: label,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 11,
                  fontFamily: Const.poppins,
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
            textInputAction: textInputAction),
      ),
    );
  }
}
