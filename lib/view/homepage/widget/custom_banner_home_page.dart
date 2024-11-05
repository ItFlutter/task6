import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomBannerHomePage extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomBannerHomePage(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Image.asset(AppImageAsset.banner),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.style12.copyWith(fontFamily: "Raleway"),
            ),
            Text(
              subTitle,
              style: Styles.style36,
            ),
          ],
        ),
      ),
      Positioned(
        right: 30.w,
        bottom: 20.h,
        // padding: EdgeInsets.only(right: 30.0.w),
        child: Align(
          alignment: Alignment.topRight,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(15 / 360),
            child: Image.asset(
              AppImageAsset.product,
              height: 90.h,
            ),
          ),
        ),
      )
    ]);
  }
}
