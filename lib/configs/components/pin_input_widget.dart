import '../../utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? validator;
  const PinInputWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onChange,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
        autofocus: false,
        autofillHints: [AutofillHints.username],
        length: 4,
        focusNode: focusNode,
        controller: controller,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ], //
        defaultPinTheme: PinTheme(
          width: 55.w,
          height: 55.h,
          textStyle: const TextStyle(
            fontSize: 20,
            fontFamily: Const.poppins,
            color: ThemeConfig.blackColor,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeConfig.blackColor,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        focusedPinTheme: PinTheme(
          width: 55.w,
          height: 55.h,
          textStyle: const TextStyle(
              fontSize: 20,
              fontFamily: Const.poppins,
              color: ThemeConfig.blackColor,
              fontWeight: FontWeight.w600),
          decoration: BoxDecoration(
            border: Border.all(color: ThemeConfig.primaryColor),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        submittedPinTheme: PinTheme(
          width: 55.w,
          height: 55.h,
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontFamily: Const.poppins,
            color: ThemeConfig.blackColor,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: ThemeConfig.primaryColorDark),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        validator: validator,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: onChange);
  }
}
