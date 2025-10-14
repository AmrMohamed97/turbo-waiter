import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/gen/assets.gen.dart';

class ModernLoginHeader extends StatelessWidget {
  const ModernLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 768;
    final isLandscape = screenWidth > screenHeight;

    // Responsive logo size
    final logoSize = isTablet
        ? (isLandscape ? 0.12 * screenWidth : 0.15 * screenHeight)
        : (screenWidth * 0.3).clamp(100.0, 150.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 4.w : 6.w,
        vertical: isTablet ? 2.h : 4.h,
      ),
      child: Column(
        children: [
          // Logo with splash screen styling
          Container(
            width: logoSize,
            height: logoSize,
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
                padding: EdgeInsets.all(logoSize * 0.08),
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

          // Subtitle with splash screen styling
        ],
      ),
    );
  }
}
