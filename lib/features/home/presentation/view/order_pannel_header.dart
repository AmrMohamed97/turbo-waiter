import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/gen/assets.gen.dart';

class OrderPannelHeader extends StatelessWidget {
  const OrderPannelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          // Time display
          Text(
            '6:13',
            style: TextStyles.font18WhiteBold.copyWith(fontSize: 18.sp),
          ),
          const Spacer(),
          // App Logo with glassmorphism effect
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Assets.images.appLogoWord.image(
              height: 30.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}