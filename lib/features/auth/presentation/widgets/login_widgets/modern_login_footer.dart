import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModernLoginFooter extends StatelessWidget {
  final VoidCallback? onForgotPasswordPressed;
  final VoidCallback? onSignUpPressed;

  const ModernLoginFooter({
    super.key,
    this.onForgotPasswordPressed,
    this.onSignUpPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Forgot password link
        TextButton(
          onPressed: onForgotPasswordPressed,
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'tajawal',
              decoration: TextDecoration.underline,
              decorationColor: Colors.white.withOpacity(0.7),
            ),
          ),
        ),

        SizedBox(height: 2.h),

        // Sign up section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14.sp,
                fontFamily: 'tajawal',
              ),
            ),
            GestureDetector(
              onTap: onSignUpPressed,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: const Color(0xFFFF8C00), // Orange from app icon
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'tajawal',
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFFFF8C00),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
