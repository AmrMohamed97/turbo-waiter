import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/helpers/spacing.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class ScaffoldTransAppBar extends StatelessWidget {
  final Widget? leading, actions, body;
  final String title;
  final Color? backgroundColor, iconColor;
  final TextStyle? titleStyle;
  final VoidCallback? onBackPressed;
  const ScaffoldTransAppBar({
    super.key,
    this.onBackPressed,
    this.leading,
    this.actions,
    this.body,
    required this.title,
    this.backgroundColor,
    this.iconColor,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? ColorsManager.bgColor,

      body: Column(
        spacing: 1.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(4),
          Row(
            children: [
              AnimatedRotation(
                turns: context.locale == Locale('en', 'US') ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                child: SvgPicture.asset(Assets.assetsSvgSearchArrowBack),
              ).onTap(
                onTap: () =>
                    (onBackPressed != null) ? onBackPressed!() : context.pop(),
              ),
              Text(
                title,
                style:
                    titleStyle ??
                    TextStyles.font16BlackExtraBold.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 19.sp,
                    ),
                textAlign: TextAlign.center,
              ).expand(),
              ?actions,
            ],
          ).paddingSymmetric(horizontal: 5.w),
          // Row(
          //   children: [
          //     leading ??
          //         IconButton(
          //           onPressed: () {
          //             if (onBackPressed != null) onBackPressed!();
          //             context.pop();
          //           },
          //           icon: Icon(Icons.arrow_back_ios),
          //           color: iconColor ?? ColorsManager.mainHomeColor,
          //         ),
          //     Text(
          //       title,
          //       style:
          //           titleStyle ??
          //           TextStyles.font17BlackExtraBold.copyWith(
          //             color: ColorsManager.mainHomeColor,
          //           ),
          //     ),
          //     Spacer(),
          //     actions ??
          //         IconButton(
          //           onPressed: () {
          //             // Implement search functionality here
          //           },
          //           icon: Icon(Icons.search),
          //           color: iconColor ?? ColorsManager.mainHomeColor,
          //         ),
          //   ],
          // ).paddingDirOnly(start: 5.w, end: 7.w),
          verticalSpace(2),
          ?body,
        ],
      ),
    );
  }
}
