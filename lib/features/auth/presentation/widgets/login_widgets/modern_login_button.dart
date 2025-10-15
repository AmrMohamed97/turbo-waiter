import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';

class ModernLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? buttonText;

  const ModernLoginButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768;

    // Responsive sizing
    final buttonHeight = isTablet ? 50.h : 40.h;
    final fontSize = isTablet ? 20.sp : 18.sp;
    final loadingSize = isTablet ? 70.w : 60.w;

    return Container(
      width: double.infinity,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFF8C00), // Orange from app icon
            Color(0xFFDC143C), // Red from app icon
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF8C00).withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFFDC143C).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFF8C00).withValues(alpha: 0.9),
                  const Color(0xFFDC143C).withValues(alpha: 0.9),
                ],
              ),
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: loadingSize,
                      height: loadingSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    )
                  : Text(
                      buttonText ?? AppTexts.login,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'tajawal',
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
