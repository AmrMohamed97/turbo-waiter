import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/features/splash/presentation/logic/splash_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  final bool getData;
  const SplashScreen({super.key, this.getData = false});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> checkFirstTime() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      bool isLogged = await context.read<SplashCubit>().checkIfUserLogged();

      goTo(isLogged);
    });
  }

  Future<void> goTo(bool isLogged) async {
    if (isLogged) {
      // go to home screen
      context.pushReplacementNamed(Routes.homeScreen);
    } else {
      context.pushReplacementNamed(Routes.loginScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    final Animation<double> curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    // Define the tween
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(curve);
    _controller.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await checkFirstTime();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
        backgroundColor: ColorsManager.bgColor,
        body: InkWell(
          onTap: () {
            goTo(false);
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Container(
                        width: 50.w,
                        height: 30.h,
                        padding: const EdgeInsets.all(10),
                        child: Center(child: Image.asset(Assets.logo)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
