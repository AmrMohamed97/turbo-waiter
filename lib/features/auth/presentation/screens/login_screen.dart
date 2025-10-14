import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/app_dialogs.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  children: [
                    SizedBox(height: 2.h),

                    // Modern header with logo
                    const ModernLoginHeader(),

                    SizedBox(height: 4.h),

                    // Login form with glassmorphism effect
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                            AppDialogs.showErrorDialogue(
                              context,
                              state.errorMessage,
                            );
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

                              SizedBox(height: 3.h),

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

                              SizedBox(height: 4.h),

                              // Login button
                              ModernLoginButton(
                                onPressed: () async {
                                  await context
                                      .read<AuthCubit>()
                                      .checkLoginFormValidation();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 3.h),

                    // Social login
                    const ModernSocialLogin(),

                    SizedBox(height: 3.h),

                    // Footer with links
                    const ModernLoginFooter(),

                    SizedBox(height: 2.h),
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
