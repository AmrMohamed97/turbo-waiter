import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/font_weight_helper.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/gen/assets.gen.dart';

class SoonWidget extends StatelessWidget {
  const SoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.w,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left side - Logo
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.images.appLogoFork.path, width: 20.w),
                    SizedBox(height: 2.h),
                    Text(
                      'Turbo Waiter',
                      style: TextStyles.font20LightBlackRegular.copyWith(
                        fontWeight: FontWeightHelper.extraBold,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right side - Coming soon message
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.comingSoon,
                    style: TextStyles.font20LightBlackRegular.copyWith(
                      fontWeight: FontWeightHelper.extraBold,
                      fontSize: 32.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'This feature is being developed\nfor the best tablet experience',
                    style: TextStyles.font20LightBlackRegular.copyWith(
                      fontSize: 18.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  const _BouncingDot(),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 5.h, horizontal: 5.w).center(),
      ),
    ).paddingSymmetric(horizontal: 5.w, vertical: 1.h);
  }
}

class _BouncingDot extends StatefulWidget {
  const _BouncingDot();

  @override
  State<_BouncingDot> createState() => _BouncingDotState();
}

class _BouncingDotState extends State<_BouncingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounce;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _bounce = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounce,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_bounce.value),
          child: child,
        );
      },
      child: Icon(
        Icons.fiber_manual_record,
        color: ColorsManager.secondaryColor,
        size: 12.w,
      ),
    );
  }
}
