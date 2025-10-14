import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/gen/assets.gen.dart';

class ModernLoginHeader extends StatelessWidget {
  const ModernLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Column(
        children: [
          // Logo with splash screen styling
          Container(
            width: 25.w,
            height: 25.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
                BoxShadow(
                  color: ColorsManager.secondaryColor.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Image.asset(
                  Assets.images.appLogoFork.path,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          SizedBox(height: 3.h),

          // App name with splash screen styling
          Text(
            'Turbo Waiter',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'tajawal',
              letterSpacing: 2,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 1.h),

          // Subtitle with splash screen styling
          Text(
            AppTexts.loginUsingEmailOrPhone,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white.withOpacity(0.9),
              fontFamily: 'tajawal',
              letterSpacing: 1,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
