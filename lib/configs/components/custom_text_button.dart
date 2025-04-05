import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final IconData? icon;
  final VoidCallback? onPress;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const CustomTextButton({
    super.key,
    this.height,
    this.width,
    this.title,
    this.icon,
    this.onPress,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Text(
          title ?? AppLocalizations.of(context)!.button,
          style: textStyle ??
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18.sp,
                  fontFamily: Const.poppins,
                  color: ThemeConfig.whiteColor,
                  fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
