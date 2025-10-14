import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/spacing.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/font_weight_helper.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

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
        child: Column(
          spacing: 1.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.logo, width: 25.w),

            // Icon(
            //   Icons.construction,
            //   size: 25.w,
            //   color: ColorsManager.mainHomeColor,
            // ),
            Text(
              AppTexts.comingSoon,
              style: TextStyles.font20LightBlackRegular.copyWith(
                fontWeight: FontWeightHelper.extraBold,
              ),
            ),
            verticalSpace(2),
            const _BouncingDot(),
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
