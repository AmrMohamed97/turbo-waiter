import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserTypeCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String imageSource;
  final String? selectedImageSource;
  const UserTypeCard({
    super.key,
    required this.title,
    required this.imageSource,
    required this.selected,
    this.selectedImageSource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
      decoration: BoxDecoration(
        color: selected ? ColorsManager.gray7 : ColorsManager.green3,
        border: selected
            ? Border.all(width: 2, color: ColorsManager.green1)
            : null,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Column(
        spacing: 1.h,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                decoration: BoxDecoration(
                  color: selected ? ColorsManager.green3 : ColorsManager.green4,
                ),
                child: Image.asset(
                  (selected && (selectedImageSource != null))
                      ? selectedImageSource ?? ""
                      : imageSource,
                  fit: BoxFit.cover,
                  height: 10.h,
                  color: selectedImageSource != null
                      ? null
                      : selected
                      ? ColorsManager.green1
                      : null,
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
              if (selected)
                PositionedDirectional(
                  top: -1.h,
                  start: -2.w,
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: ColorsManager.green1,
                  ),
                ),
            ],
          ),
          Text(
            title,
            style: TextStyles.font18BlackExtraBold.copyWith(
              color: selected ? Colors.black : ColorsManager.gray8,
            ),
          ),
        ],
      ),
    );
  }
}
