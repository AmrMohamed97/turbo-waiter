import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/colors.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomDialog({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: ColorsManager.primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primaryColor,
            fontFamily: 'tajawal',
          ),
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
      elevation: 8,
      shadowColor: ColorsManager.primaryColor.withOpacity(0.3),
    );
  }
}
