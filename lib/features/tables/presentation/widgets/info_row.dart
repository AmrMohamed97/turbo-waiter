import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white.withValues(alpha: 0.9), size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyles.font14WhiteBold.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyles.font16WhiteBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
