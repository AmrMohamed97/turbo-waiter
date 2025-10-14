import 'dart:ui';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/helpers/spacing.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/font_weight_helper.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/core/widgets/app_text_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppDialogs {
  static Future<void> showQuestionnaireDialog(
    BuildContext context,
    String message,
    Function yesActionBtn, {
    double? width,
    double? height,
    double? radius,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: width ?? 85.w,
              height: height ?? 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 3.w),
                color: Colors.white,
              ),
              child: Column(
                spacing: 3.h,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    softWrap: true,

                    style: TextStyles.font15BlackMedium.copyWith(
                      fontSize: 17.sp,

                      // color: ColorsManager.primaryColor,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                  Row(
                    spacing: 5.w,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppTextButton(
                        horizontalPadding: 00,
                        verticalPadding: 0,
                        borderRadius: 4,
                        backgroundColor: Colors.red,
                        buttonText: AppTexts.yes,
                        onPressed: () {
                          context.pop();
                          yesActionBtn();
                        },
                      ).expand(),
                      AppTextButton(
                        horizontalPadding: 00,
                        verticalPadding: 0,
                        borderRadius: 4,
                        buttonText: AppTexts.no,
                        backgroundColor: ColorsManager.gray1_7,
                        onPressed: context.pop,
                      ).expand(),
                      // Expanded(
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: ColorsManager.primaryColor,
                      //       padding: EdgeInsets.all(1.w),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(0.5.w),
                      //       ),
                      //     ),
                      //     onPressed: () {
                      //       context.pop();
                      //     },
                      //     child: Text(
                      //       AppTexts.no,
                      //       style: TextStyles.font15BlackMedium.copyWith(
                      //         color: Colors.white,
                      //         fontWeight: FontWeightHelper.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 6.w, vertical: 1.h),
            ),
          ),
        );
      },
    );
  }

  static void showLoadingWithSentence(
    BuildContext context,
    String sentence, {
    double? width,
    double? height,
    double? radius,
    bool canPop = false,
    double? padding,
  }) {
    showDialog(
      barrierDismissible: canPop,
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: PopScope(
          canPop: canPop,
          child: Center(
            child: Container(
              // padding: EdgeInsets.all(padding ?? 2.w),
              width: width ?? 85.w,
              height: height ?? 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 3.w),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  spacing: 4.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ),
                    // verticalSpace(2),
                    Text(
                      sentence,
                      style: TextStyles.font16WhiteBold.copyWith(
                        color: ColorsManager.primaryColor,
                        fontSize: 18.sp,
                      ),
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

  static void showLoadingDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      useRootNavigator: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return PopScope(
              canPop: false,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                ],
              ),
            );
          },
    );
  }

  static void showNewTost({
    required BuildContext context,
    required String msg,
    void Function()? onTap,
    Color? cardColor,
    Color? titleColor,
  }) {
    late DelightToastBar toast;
    toast = DelightToastBar(
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(seconds: 4),
      animationCurve: Curves.easeInOut,
      autoDismiss: true,
      builder: (context) => GestureDetector(
        onHorizontalDragUpdate: (details) {
          // تعطيل السحب الأفقى عن طريق عدم تنفيذ أي إجراء هنا
          toast.remove();
        },
        child: ToastCard(
          color: cardColor ?? ColorsManager.primaryColor,
          onTap: () {
            toast.remove(); // Use remove to dismiss the toast
            if (onTap != null) {
              onTap();
            }
          },
          leading: Icon(
            Icons.flutter_dash,
            size: 3.5.w,
            color: titleColor ?? Colors.white,
          ),
          title: Center(
            child: Text(
              msg,
              style: TextStyles.font16BlackRegular.copyWith(
                fontWeight: FontWeightHelper.extraBold,
                fontSize: 16.sp,
                color: titleColor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    toast.show(context);
  }

  static void showDialogWithImage(
    BuildContext context,
    String sentence, {
    bool canPop = false,
    Widget? image,
    double? width,
    double? height,
    double? padding,
    VoidCallback? onConfirm,
    VoidCallback? onClose,
    bool showActions = false,
    String? confirmText,
    String? cancelText,
  }) {
    showDialog(
      barrierDismissible: canPop,
      context: context,
      builder: (context) => PopScope(
        canPop: canPop,
        child: Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.all(padding ?? 5.w),
              width: width ?? 90.w,
              height: height ?? 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  spacing: 2.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image ??
                        const CircularProgressIndicator(
                          color: ColorsManager.primaryColor,
                        ),
                    verticalSpace(2),
                    Text(sentence, style: TextStyles.font17BlackExtraBolder),
                    if (showActions)
                      Row(
                        spacing: 5.w,
                        children: [
                          Expanded(
                            child: AppTextButton(
                              horizontalPadding: 0,
                              verticalPadding: 0.1,
                              buttonText: confirmText ?? AppTexts.confirm,
                              onPressed: onConfirm ?? () {},
                            ),
                          ),
                          Expanded(
                            child: AppTextButton(
                              horizontalPadding: 0,
                              verticalPadding: 0.1,
                              backgroundColor: Colors.white,
                              buttonBorder: WidgetStatePropertyAll(
                                BorderSide(color: ColorsManager.primaryColor),
                              ),
                              textStyle: TextStyles.font17PrimaryBold,
                              buttonText: cancelText ?? AppTexts.cancel,
                              onPressed: onClose ?? () {},
                            ),
                          ),
                        ],
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

  static Future<void> showErrorDialogue(
    BuildContext context,
    String message, {
    VoidCallback? onCancel,
  }) async {
    await showGeneralDialog(
      context: context,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      width: 90.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.w)),
                      ),
                      child: Column(
                        spacing: 1.h,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SvgPicture.asset(Assets.assetsSvgError),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Column(
                              spacing: 1.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message,
                                  textAlign: TextAlign.start,
                                  style: TextStyles.font16BlackBold,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: AppTextButton(
                              horizontalPadding: 0,
                              verticalPadding: 0.1,
                              buttonText: AppTexts.cancel,
                              onPressed: () {
                                context.pop();
                                onCancel?.call();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
    );
  }

  static void showTopPopup(
    BuildContext context,
    Widget child, {
    double? height,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,

      barrierLabel: '',
      pageBuilder: (_, _, _) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              // 🔹 Blurred background
              GestureDetector(
                onTap: () => context.pop(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Color.fromARGB(97, 215, 215, 218),
                  ), //#1717253D #BDBEC3
                ),
              ),

              // 🔹 Popup at the top
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 100.w,
                  height: height ?? 30.h,

                  decoration: BoxDecoration(
                    color: Colors.white,

                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black26,
                    //     blurRadius: 10,
                    //     offset: Offset(0, 4),
                    //   ),
                    // ],
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, _, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(anim),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
