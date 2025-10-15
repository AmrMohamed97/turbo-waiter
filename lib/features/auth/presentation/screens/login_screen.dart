import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/helpers/app_dialogs.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/modern_input_field.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/modern_login_button.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/modern_login_footer.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/modern_login_header.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/modern_social_login.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 768;
    final isLandscape = screenWidth > screenHeight;

    return PopScope(
      canPop: canReturn,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && Platform.isAndroid) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFF8C00), // Orange from app icon
                Color(0xFFDC143C), // Red from app icon
                Color(0xFFB22222), // Darker red for depth
              ],
              stops: [0.0, 0.6, 1.0],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 6.w : 8.w,
                    vertical: isTablet ? 2.h : 4.h,
                  ),
                  child: isTablet && isLandscape
                      ? _buildTabletLandscapeLayout(context)
                      : _buildMobileLayout(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLandscapeLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left side - Header and branding
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              // Modern header with logo
              const ModernLoginHeader(),
              SizedBox(height: 20.h),
              // Additional branding for tablet
              Column(
                children: [
                  Text(
                    'مرحبا بك في توربو ',
                    style: TextStyles.boldTextStyle.copyWith(
                      fontSize: 32.sp,

                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "تطبيق للطلبات الإلكترونية",
                    style: TextStyles.mediumTextStyle.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(width: 20.w),

        // Right side - Login form
        Expanded(flex: 3, child: _buildLoginForm(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 4.h),
        // Modern header with logo
        const ModernLoginHeader(),
        SizedBox(height: 4.h),
        // Login form
        _buildLoginForm(context),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768;
    final isLandscape = screenWidth > MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(
          AppTexts.loginUsingEmailOrPhone,
          style: TextStyles.font16BlackBold.copyWith(
            color: Colors.white,
            fontSize: isTablet ? 20.sp : 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isTablet ? 30 : 20),
        Container(
          constraints: BoxConstraints(
            maxWidth: isTablet
                ? (isLandscape ? 0.4 * screenWidth : 0.6 * screenWidth)
                : 0.9 * screenWidth,
          ),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                AppDialogs.showLoadingWithSentence(
                  context,
                  AppTexts.signInLoading,
                  canPop: true,
                );
              }
              if (state is AuthSuccessState) {
                context.pop();
                context.pushReplacementNamed(Routes.homeScreen);
              }
              if (state is AuthFailureState) {
                context.pop();
                AppDialogs.showErrorDialogue(context, state.errorMessage);
              }
            },
            child: Form(
              key: context.read<AuthCubit>().loginFormKey,
              child: Column(
                children: [
                  // Username field
                  ModernInputField(
                    controller: context
                        .read<AuthCubit>()
                        .userNameLoginController,
                    hintText: AppTexts.enterUserName,
                    label: AppTexts.nameOrEmail,
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.emailAddress,
                    required: true,
                  ),

                  SizedBox(height: 20.h),

                  // Password field
                  ModernInputField(
                    controller: context
                        .read<AuthCubit>()
                        .passwordLoginController,
                    hintText: AppTexts.enterPassword,
                    label: AppTexts.password,
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                    obscureTextNotifier: context
                        .read<AuthCubit>()
                        .loginObscurePasswordNotifier,
                    required: true,
                  ),

                  SizedBox(height: 40.h),

                  // Login button
                  ModernLoginButton(
                    onPressed: () async {
                      // await context
                      //     .read<AuthCubit>()
                      //     .checkLoginFormValidation();
                      context.pushReplacementNamed(Routes.homeScreen);
                    },
                  ),

                  SizedBox(height: isTablet ? 4.h : 3.h),

                  // Social login
                  // const ModernSocialLogin(),
                  SizedBox(height: 20.h),

                  // Footer with links
                  // const ModernLoginFooter(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
