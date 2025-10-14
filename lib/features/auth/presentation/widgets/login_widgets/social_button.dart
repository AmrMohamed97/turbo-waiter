import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class SocialButton extends StatelessWidget {
  final String title, image;
  final VoidCallback? onTap;
  const SocialButton({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 7.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.gray1_5, width: 1),
        borderRadius: BorderRadius.circular(2.w),
      ),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: Row(
        spacing: 2.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.font16BlackBold.copyWith(
              color: ColorsManager.grayColor30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(image),
        ],
      ),
    ).onTap(onTap: onTap);
  }
}
