import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class TableOptionsCard extends StatelessWidget {
  const TableOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.settings_outlined, color: Colors.white, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                'خيارات',
                style: TextStyles.font18WhiteBold.copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Switch table option
          _buildOptionButton(
            context: context,
            icon: Icons.swap_horiz,
            label: 'هل تريد تبديل مكان الطاولة',
            color: ColorsManager.primaryColor,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 12.h),
          // Cancel reservation option
          _buildOptionButton(
            context: context,
            icon: Icons.cancel_outlined,
            label: 'تقديم طلب إلغاء الحجز',
            color: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 12.h),
          // Cancel option
          _buildOptionButton(
            context: context,
            icon: Icons.close,
            label: 'إلغاء',
            color: ColorsManager.gray1,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyles.font16WhiteBold.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
