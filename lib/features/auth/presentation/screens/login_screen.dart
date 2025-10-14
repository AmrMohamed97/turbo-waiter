import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  final bool canReturn;
  final bool backAfterSuccess;
  const LoginScreen({
    super.key,
    this.canReturn = true,
    this.backAfterSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canReturn,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && Platform.isAndroid) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 2.5.h,
              children: [
                Center(child: Image.asset(Assets.logo, height: 25.h)),

                Text(
                  AppTexts.login,
                  style: TextStyles.font18BlackBold.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 22.sp,
                  ),
                ).paddingSymmetric(horizontal: 5.w),
                //login form
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
