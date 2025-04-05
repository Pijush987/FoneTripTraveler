import 'dart:io';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class CustomExtendedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool cache;

  const CustomExtendedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.borderRadius,
    this.cache = true,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http')) {
      // Network Image
      return _buildImage(
          ExtendedImage.network(imageUrl, fit: fit, cache: cache));
    } else if (imageUrl.startsWith('assets/')) {
      // Asset Image
      return _buildImage(ExtendedImage.asset(imageUrl, fit: fit));
    } else if (imageUrl.startsWith('/')) {
      // File Image (Local Storage)
      return _buildImage(ExtendedImage.file(File(imageUrl), fit: fit));
    } else {
      return const Center(child: Text("Invalid Image Path"));
    }
  }

  Widget _buildImage(Widget image) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: image,
      ),
    );
  }
}
