import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/helpers/app_dialogs.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/helpers/spacing.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/core/widgets/app_text_button.dart';
import 'package:turbo_waiter/core/widgets/custom_app_text_field.dart';
import 'package:turbo_waiter/features/auth/presentation/logic/cubit/auth_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    return Form(
      key: authCubit.loginFormKey,
      child: Column(
        spacing: 2.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppTextField(
            prefixIcon: Icon(Icons.person), //.paddingAll(3.5.w),
            controller: authCubit.userNameLoginController,
            hintText: AppTexts.enterUserName,
            label: AppTexts.nameOrEmail,
            inputTextStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyles.font16BlackBold.copyWith(
              color: ColorsManager.blackColor5,
            ),
            borderColor: ColorsManager.grayColor31,
            borderRadius: 2.w,
            required: true,
          ),

          // CustomMobileField(
          //   controller: authCubit.phoneLoginController,
          //   label: AppTexts.phone ,
          //   labelStyle: TextStyles.font15BlackBold,
          //   labelOnly: true,
          //   onChanged: (phone) {
          //     authCubit.loginPhoneNumber = phone;
          //   },
          //   required: true,
          //   allCountries: true,
          // ),
          CustomAppTextField(
            prefixIcon: Icon(Icons.lock), //.paddingAll(3.5.w),
            controller: authCubit.passwordLoginController,
            hintText: AppTexts.enterPassword,
            label: AppTexts.password,
            labelStyle: TextStyles.font16BlackBold.copyWith(
              color: ColorsManager.blackColor5,
            ),
            borderRadius: 2.w,
            borderColor: ColorsManager.grayColor31,
            inputTextStyle: TextStyle(color: Colors.black),
            isObscuredPassword: true,
            obscureTextNotifier: authCubit.loginObscurePasswordNotifier,
            required: true,
          ),
          verticalSpace(0.1),
          BlocListener<AuthCubit, AuthState>(
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

            child: AppTextButton(
              horizontalPadding: 0,
              verticalPadding: 0,
              buttonWidth: 70,
              borderRadius: 3,
              buttonText: AppTexts.login,
              backgroundColor: ColorsManager.blackColor4,
              onPressed: () async {
                await context.read<AuthCubit>().checkLoginFormValidation();
              },
            ).center(),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 5.w, vertical: 1.h);
  }
}
