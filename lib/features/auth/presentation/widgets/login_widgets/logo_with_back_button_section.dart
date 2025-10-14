import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';

class LogoWithBackButtonSection extends StatelessWidget {
  const LogoWithBackButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 100.w,

      child: Stack(
        children: [
          Image.asset(
            Assets.assetsImagesLoginImage,
            fit: BoxFit.fill,
            height: 29.h,
            width: 100.w,
          ),
          Container(
            height: 30.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.25, 0.8],
                colors: ColorsManager.loginGradient,
              ),
            ),
          ),
          Image.asset(
            Assets.logo,
            color: ColorsManager.primaryColor,
            colorBlendMode: BlendMode.srcIn,
          ).center().paddingOnly(top: 5.h),
          // PositionedDirectional(
          //   top: 5.h,
          //   start: 2.w,
          //   child: IconButton(
          //     onPressed: () {
          //       context.pop();
          //     },
          //     icon: const Icon(Icons.arrow_back_ios_new),
          //   ),
          // ),
        ],
      ),
    );
  }
}
