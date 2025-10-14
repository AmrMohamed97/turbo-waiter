import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theming/colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor, textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final WidgetStateProperty<BorderSide>? buttonBorder;
  final bool enabled, withFittedBox, loading;
  final Widget? child;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    required this.horizontalPadding,
    required this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
    this.buttonBorder,
    this.enabled = true,
    this.withFittedBox = false,
    this.loading = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: buttonBorder,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((borderRadius ?? 10).w),
          ),
        ),

        backgroundColor: WidgetStatePropertyAll(
          enabled
              ? backgroundColor ?? ColorsManager.primaryColor
              : ColorsManager.gray1_6,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding.w,
            vertical: verticalPadding.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 7.h),
        ),
      ),
      onPressed: (enabled || !loading) ? onPressed : null,
      child: loading
          ? Padding(
              padding: EdgeInsets.all(2.w),
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
          : child != null
          ? child!
          : withFittedBox
          ? FittedBox(
              child: Text(
                buttonText,
                style:
                    textStyle ??
                    TextStyles.font17WhiteBold.copyWith(color: textColor),
              ),
            )
          : Text(
              buttonText,
              style:
                  textStyle ??
                  TextStyles.font17WhiteBold.copyWith(color: textColor),
            ),
    );
  }
}
