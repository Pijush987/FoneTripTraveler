import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageWidget extends StatelessWidget {
  final String? svgPath;
  final double? hight;
  final double? width;
  final ColorFilter? colorFilter;
  const SvgImageWidget({
    super.key,
    required this.svgPath,
    this.colorFilter,
    this.hight,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath ?? AssetsPath.error,
      colorFilter: colorFilter,
      height: hight,
      width: width,
    );
  }
}
