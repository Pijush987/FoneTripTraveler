import 'package:flutter/material.dart';
import '../../../configs/configs.dart';
import 'package:traveler/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5.w,
      children: List.generate(5, (index) {
        return index < rating.toInt()
            ? SvgImageWidget(
                svgPath: AssetsPath.starFill,
                hight: 24.h,
              )
            : SvgImageWidget(
                svgPath: AssetsPath.star,
                hight: 24.h,
              );
      }),
    );
  }
}
