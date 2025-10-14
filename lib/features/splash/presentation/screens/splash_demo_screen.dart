import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/features/splash/presentation/screens/splash_screen.dart';

class SplashDemoScreen extends StatelessWidget {
  const SplashDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgColor,
      appBar: AppBar(
        title: const Text('Splash Screen Demo'),
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Your Splash Screen Style',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),

            // Enhanced Splash with Static Logo
            _buildDemoCard(
              context,
              title: 'Enhanced Splash (Static Logo)',
              description:
                  'Beautiful animations with floating particles, sparkles, and smooth transitions using your app logo',
              onTap: () => _navigateToSplash(context, useLottie: false),
              icon: Icons.image,
              color: ColorsManager.primaryColor,
            ),

            SizedBox(height: 3.h),

            // Enhanced Splash with Lottie Animation
            _buildDemoCard(
              context,
              title: 'Enhanced Splash (Lottie Animation)',
              description:
                  'Same beautiful animations but with a custom Lottie animation of fork and knife',
              onTap: () => _navigateToSplash(context, useLottie: true),
              icon: Icons.animation,
              color: ColorsManager.secondaryColor,
            ),

            SizedBox(height: 4.h),

            // Features List
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✨ Features',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  _buildFeatureItem('🎨 Beautiful gradient background'),
                  _buildFeatureItem('🌟 Floating particle animations'),
                  _buildFeatureItem('✨ Sparkle effects'),
                  _buildFeatureItem(
                    '🔄 Smooth logo animations (scale, rotate, fade)',
                  ),
                  _buildFeatureItem('📱 Responsive design'),
                  _buildFeatureItem('⚡ Smooth fade-out transitions'),
                  _buildFeatureItem('🎭 Optional Lottie animations'),
                  _buildFeatureItem('🏪 Restaurant-themed design'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoCard(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.3), width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 6.w),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorsManager.grayColor1,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 4.w),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        children: [
          SizedBox(width: 2.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: ColorsManager.grayColor1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToSplash(BuildContext context, {required bool useLottie}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SplashScreen(useLottieAnimation: useLottie),
      ),
    );
  }
}
