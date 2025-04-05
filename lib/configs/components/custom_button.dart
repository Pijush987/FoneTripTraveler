import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final IconData? icon;
  final VoidCallback? onPress;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? borderRadios;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final AlignmentGeometry? alignment;
  final Widget? widget;

  const CustomButton(
      {super.key,
      this.height,
      this.width,
      this.title,
      this.icon,
      this.onPress,
      this.borderColor,
      this.backgroundColor,
      this.iconColor,
      this.textStyle,
      this.borderRadios,
      this.boxShadow,
      this.padding,
      this.alignment,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ThemeConfig.transparent,
      highlightColor: ThemeConfig.transparent,
      hoverColor: ThemeConfig.transparent,
      focusColor: ThemeConfig.transparent,
      onTap: onPress,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        height: height ?? 60.h,
        width: width ?? 500.w,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? ThemeConfig.primaryColor,
          borderRadius: BorderRadius.circular(borderRadios ?? 10),
          border: Border.all(color: borderColor ?? ThemeConfig.backgroundColor),
          boxShadow: boxShadow,
        ),
        child: widget ??
            Text(
              title ?? AppLocalizations.of(context)!.button,
              style: textStyle ??
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      color: ThemeConfig.whiteColor,
                      fontWeight: FontWeight.w600),
            ),
      ),
    );
  }
}
