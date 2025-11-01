import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/features/tables/presentation/page/tables_page.dart';
import 'package:turbo_waiter/features/tables/presentation/widgets/info_row.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key, required this.table});
  final TableModel table;
  @override
  Widget build(BuildContext context) {
    return table.user == null
        ? Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
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
                    Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'بيانات المستخدم',
                      style: TextStyles.font18WhiteBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'لا توجد بيانات متاحة',
                  style: TextStyles.font16WhiteRegular.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
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
                    Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'بيانات المستخدم',
                      style: TextStyles.font18WhiteBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                InfoRow(
                  icon: Icons.badge_outlined,
                  label: 'رقم المستخدم',
                  value: '${table.user!.userId}',
                ),
                SizedBox(height: 16.h),
                InfoRow(
                  icon: Icons.alternate_email,
                  label: 'اسم المستخدم',
                  value: table.user!.username,
                ),
                if (table.user!.fullName != null) ...[
                  SizedBox(height: 16.h),
                  InfoRow(
                    icon: Icons.person,
                    label: 'الاسم الكامل',
                    value: table.user!.fullName!,
                  ),
                ],
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.orange2.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: ColorsManager.orange2.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.table_restaurant,
                        color: ColorsManager.orange2,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'الطاولة ${table.id}',
                          style: TextStyles.font16WhiteBold.copyWith(
                            color: ColorsManager.orange2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
