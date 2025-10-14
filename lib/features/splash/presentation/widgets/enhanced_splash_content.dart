import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class EnhancedSplashContent extends StatefulWidget {
  final Animation<double> logoScaleAnimation;
  final Animation<double> logoRotationAnimation;
  final Animation<double> logoFadeAnimation;
  final Animation<double> particleAnimation;
  final Animation<double> sparkleAnimation;
  final bool useLottieAnimation;

  const EnhancedSplashContent({
    super.key,
    required this.logoScaleAnimation,
    required this.logoRotationAnimation,
    required this.logoFadeAnimation,
    required this.particleAnimation,
    required this.sparkleAnimation,
    this.useLottieAnimation = false,
  });

  @override
  State<EnhancedSplashContent> createState() => _EnhancedSplashContentState();
}

class _EnhancedSplashContentState extends State<EnhancedSplashContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated background particles
        _buildAnimatedParticles(),

        // Sparkle effects
        _buildSparkleEffects(),

        // Main content - optimized for tablet landscape
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left side - Logo
              Expanded(flex: 2, child: Center(child: _buildAnimatedLogo())),

              // Right side - App name and loading
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App name with fade animation
                    _buildAppName(),

                    SizedBox(height: 4.h),

                    // Loading indicator
                    _buildLoadingIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedParticles() {
    return AnimatedBuilder(
      animation: widget.particleAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(widget.particleAnimation.value),
          size: Size.infinite,
        );
      },
    );
  }

  Widget _buildSparkleEffects() {
    return AnimatedBuilder(
      animation: widget.sparkleAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: SparklePainter(widget.sparkleAnimation.value),
          size: Size.infinite,
        );
      },
    );
  }

  Widget _buildAnimatedLogo() {
    return AnimatedBuilder(
      animation: widget.logoScaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.logoScaleAnimation.value,
          child: Transform.rotate(
            angle: widget.logoRotationAnimation.value * 0.1,
            child: Opacity(
              opacity: widget.logoFadeAnimation.value,
              child: Container(
                width: 20.w,
                height: 20.w,
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
                    child: widget.useLottieAnimation
                        ? Lottie.asset(
                            Assets.lottie.restaurantAnimation,
                            fit: BoxFit.contain,
                            repeat: true,
                          )
                        : Image.asset(
                            Assets.images.appLogoFork.path,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppName() {
    return AnimatedBuilder(
      animation: widget.logoFadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: widget.logoFadeAnimation.value,
          child: Column(
            children: [
              Text(
                'Turbo Waiter',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'tajawal',
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Fast • Smart • Reliable',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white.withOpacity(0.9),
                  fontFamily: 'tajawal',
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Tablet-Optimized Restaurant Experience',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.7),
                  fontFamily: 'tajawal',
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return AnimatedBuilder(
      animation: widget.logoFadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: widget.logoFadeAnimation.value,
          child: Container(
            width: 40.w,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white.withOpacity(0.3),
            ),
            child: AnimatedBuilder(
              animation: widget.particleAnimation,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: widget.particleAnimation.value,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withOpacity(0.8),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// Custom painter for animated particles
class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final random = math.Random(42); // Fixed seed for consistent particles

    for (int i = 0; i < 20; i++) {
      final x =
          (random.nextDouble() * size.width + animationValue * 100) %
          size.width;
      final y =
          (random.nextDouble() * size.height + animationValue * 50) %
          size.height;
      final radius = 2 + random.nextDouble() * 3;

      canvas.drawCircle(
        Offset(x, y),
        radius,
        paint
          ..color = Colors.white.withOpacity(0.1 + random.nextDouble() * 0.2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Custom painter for sparkle effects
class SparklePainter extends CustomPainter {
  final double animationValue;

  SparklePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorsManager.secondaryColor.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final random = math.Random(123); // Fixed seed for consistent sparkles

    for (int i = 0; i < 8; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final opacity = (math.sin(animationValue * math.pi * 2 + i) + 1) / 2;

      if (opacity > 0.3) {
        canvas.drawCircle(
          Offset(x, y),
          3 + opacity * 2,
          paint
            ..color = ColorsManager.secondaryColor.withOpacity(opacity * 0.8),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
