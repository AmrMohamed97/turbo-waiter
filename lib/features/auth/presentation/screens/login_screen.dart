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
import 'package:turbo_waiter/core/widgets/app_text_form_field.dart';
import 'package:turbo_waiter/core/widgets/screen_wrapper.dart';
import 'package:turbo_waiter/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:turbo_waiter/features/auth/presentation/view/choose_sheft.dart';
import 'package:turbo_waiter/core/widgets/primary_button.dart';
import 'package:turbo_waiter/features/auth/presentation/widgets/login_widgets/modern_login_header.dart';

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
      child: ScreenWrapper(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20).w,
                child: _buildTabletLandscapeLayout(context),
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

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTexts.loginUsingEmailOrPhone,
          style: TextStyles.font16BlackBold.copyWith(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        Container(
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
                  AppTextFormField(
                    controller: context
                        .read<AuthCubit>()
                        .userNameLoginController,
                    hintText: AppTexts.enterUserName,
                    label: AppTexts.nameOrEmail,
                    prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppTexts.requiredField;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      context.read<AuthCubit>().userNameLoginController.text =
                          value;
                    },
                  ),

                  SizedBox(height: 20.h),

                  // Password field
                  ValueListenableBuilder(
                    valueListenable: context
                        .read<AuthCubit>()
                        .loginObscurePasswordNotifier,
                    builder: (context, value, child) {
                      return AppTextFormField(
                        controller: context
                            .read<AuthCubit>()
                            .passwordLoginController,
                        hintText: AppTexts.enterPassword,
                        label: AppTexts.password,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        keyboard: TextInputType.visiblePassword,
                        isObscureText: context
                            .read<AuthCubit>()
                            .loginObscurePasswordNotifier
                            .value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<AuthCubit>()
                                .loginObscurePasswordNotifier
                                .value = !context
                                .read<AuthCubit>()
                                .loginObscurePasswordNotifier
                                .value;
                          },
                          icon: Icon(
                            context
                                    .read<AuthCubit>()
                                    .loginObscurePasswordNotifier
                                    .value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppTexts.requiredField;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(height: 30.h),

                  // Login button
                  PrimaryButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => ChooseCShift(),
                      );
                      // context.pushReplacementNamed(Routes.homeScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
