import '../configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({super.key, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: SpinKitFadingCircle(
          size: 50.r,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index.isEven
                    ? ThemeConfig.primaryColor
                    : ThemeConfig.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
