import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double progress;
  final double thickness;
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  final Color thumbColor;
  const CustomProgressIndicator(
      {super.key,
      required this.progress,
      required this.thickness,
      required this.backgroundColor,
      required this.progressColor,
      required this.thumbColor,
      required this.size});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    double thumbPosition = widget.size * widget.progress;

    return SizedBox(
      width: widget.size + widget.thickness * 1.2,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Background Bar
          Container(
            height: widget.thickness * 1.3,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.thickness),
              boxShadow: [
                BoxShadow(
                  color: ThemeConfig.color1F1F1,
                  blurRadius: 6.0,
                  offset: const Offset(0, 3),
                )
              ],
            ),
          ),
          // Progress Bar
          LayoutBuilder(
            builder: (context, constraints) {
              double progressWidth = widget.size * widget.progress;
              return Container(
                margin: EdgeInsets.all(7),
                width: progressWidth,
                height: 6,
                decoration: BoxDecoration(
                  color: widget.progressColor,
                  borderRadius: BorderRadius.circular(widget.thickness),
                ),
              );
            },
          ),
          // Thumb Indicator
          Positioned(
            left: thumbPosition,
            child: Container(
              width: widget.thickness * 1.2,
              height: widget.thickness * 1.2,
              decoration: BoxDecoration(
                color: ThemeConfig.textColorBCBFC2,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ThemeConfig.color1F1F1,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
