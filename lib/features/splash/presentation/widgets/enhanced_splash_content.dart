import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

        // Main content - responsive layout
        Center(child: _buildTabletLandscapeLayout()),
      ],
    );
  }

  Widget _buildTabletLandscapeLayout() {
    return Row(
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 768;
    final isLandscape = screenWidth > screenHeight;

    // Responsive logo size
    final logoSize = isTablet
        ? (isLandscape ? 0.15 * screenWidth : 0.25 * screenHeight)
        : (screenWidth * 0.4).clamp(120.0, 200.0);

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
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                    BoxShadow(
                      color: ColorsManager.secondaryColor.withValues(
                        alpha: 0.4,
                      ),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(logoSize * 0.1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: 0.9),
                          Colors.white.withValues(alpha: 0.7),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 768;
    final isLandscape = screenWidth > screenHeight;

    // Responsive font sizes
    final titleSize = isTablet
        ? (isLandscape ? 0.04 * screenWidth : 0.05 * screenHeight)
        : (screenWidth * 0.08).clamp(24.0, 36.0);

    final subtitleSize = isTablet
        ? (isLandscape ? 0.02 * screenWidth : 0.025 * screenHeight)
        : (screenWidth * 0.04).clamp(14.0, 18.0);

    final taglineSize = isTablet
        ? (isLandscape ? 0.015 * screenWidth : 0.02 * screenHeight)
        : (screenWidth * 0.035).clamp(12.0, 14.0);

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
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'tajawal',
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
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
                  fontSize: subtitleSize,
                  color: Colors.white.withValues(alpha: 0.9),
                  fontFamily: 'tajawal',
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Tablet-Optimized Restaurant Experience',
                style: TextStyle(
                  fontSize: taglineSize,
                  color: Colors.white.withValues(alpha: 0.7),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 768;
    final isLandscape = screenWidth > screenHeight;

    // Responsive loading indicator size
    final indicatorWidth = isTablet
        ? (isLandscape ? 0.3 * screenWidth : 0.4 * screenWidth)
        : (screenWidth * 0.6).clamp(200.0, 300.0);

    final indicatorHeight = isTablet ? 8.0 : 6.0;

    return AnimatedBuilder(
      animation: widget.logoFadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: widget.logoFadeAnimation.value,
          child: Container(
            width: indicatorWidth,
            height: indicatorHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(indicatorHeight / 2),
              color: Colors.white.withValues(alpha: 0.3),
            ),
            child: AnimatedBuilder(
              animation: widget.particleAnimation,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: widget.particleAnimation.value,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white.withValues(alpha: 0.8),
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
      ..color = Colors.white.withValues(alpha: 0.1)
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
          ..color = Colors.white.withValues(
            alpha: 0.1 + random.nextDouble() * 0.2,
          ),
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
      ..color = ColorsManager.secondaryColor.withValues(alpha: 0.6)
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
            ..color = ColorsManager.secondaryColor.withValues(
              alpha: opacity * 0.8,
            ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
