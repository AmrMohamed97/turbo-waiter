import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/features/splash/presentation/logic/splash_cubit.dart';
import 'package:turbo_waiter/features/splash/presentation/widgets/enhanced_splash_content.dart';

class SplashScreen extends StatefulWidget {
  final bool getData;
  final bool useLottieAnimation;
  const SplashScreen({
    super.key,
    this.getData = false,
    this.useLottieAnimation = false,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _particleController;
  late AnimationController _sparkleController;
  late AnimationController _fadeController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoRotationAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _particleAnimation;
  late Animation<double> _sparkleAnimation;
  late Animation<double> _fadeAnimation;

  Future<void> checkFirstTime() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      bool isLogged = await context.read<SplashCubit>().checkIfUserLogged();
      goTo(isLogged);
    });
  }

  Future<void> goTo(bool isLogged) async {
    // Start fade out animation
    await _fadeController.forward();

    if (isLogged) {
      context.pushReplacementNamed(Routes.homeScreen);
    } else {
      context.pushReplacementNamed(Routes.loginScreen);
    }
  }

  @override
  void initState() {
    super.initState();

    // Logo animations
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoRotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    // Particle animations
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _particleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _particleController, curve: Curves.linear),
    );

    // Sparkle animations
    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _sparkleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _sparkleController, curve: Curves.easeInOut),
    );

    // Fade out animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Start animations
    _logoController.forward();
    _particleController.repeat();
    _sparkleController.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await checkFirstTime();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _particleController.dispose();
    _sparkleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && Platform.isAndroid) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorsManager.primaryColor,
                      ColorsManager.lightPrimaryColor,
                      ColorsManager.lighterPrimaryColor,
                    ],
                    stops: [0.0, 0.6, 1.0],
                  ),
                ),
                child: EnhancedSplashContent(
                  logoScaleAnimation: _logoScaleAnimation,
                  logoRotationAnimation: _logoRotationAnimation,
                  logoFadeAnimation: _logoFadeAnimation,
                  particleAnimation: _particleAnimation,
                  sparkleAnimation: _sparkleAnimation,
                  useLottieAnimation: widget.useLottieAnimation,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
