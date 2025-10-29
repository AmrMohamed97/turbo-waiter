import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.labelStyle,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.prefixIcon,
    this.borderRadius,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.maxLines,
    this.keyboard,
    this.label,
    this.inputFormatters,
    this.textAlign,
    this.cursorHeight,
    this.initialValue,
    this.onChanged,
    this.focusNode,
    this.cursorColor,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? label, initialValue;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor, cursorColor;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? keyboard;
  final double? borderRadius;
  final TextAlign? textAlign;
  final double? cursorHeight;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final isTablet = screenWidth > 768;

    // // Responsive font sizes
    // final labelSize = isTablet ? 16.sp : 15.sp;
    // final inputSize = isTablet ? 18.sp : 16.sp;
    // final hintSize = isTablet ? 17.sp : 15.sp;

    // // Responsive padding
    // final horizontalPadding = isTablet ? 5.w : 4.w;
    // final verticalPadding = isTablet ? 4.h : 3.h;
    // final iconPadding = isTablet ? 3.w : 2.w;
    // final iconMargin = isTablet ? 5.w : 4.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with white text to match modern theme
        if (label != null) ...[
          Text(
            label!,
            style:
                labelStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'tajawal',
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
          ),
          SizedBox(height: 10.h),
        ],

        // Input field with glassmorphism effect
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
            color: (backgroundColor ?? Colors.white).withValues(alpha: 0.15),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextFormField(
            initialValue: initialValue,
            cursorColor: cursorColor ?? Colors.white,
            cursorHeight: cursorHeight,

            focusNode: focusNode,
            textAlign: textAlign ?? TextAlign.start,
            inputFormatters: inputFormatters,
            onTapOutside: (pointerDownEvent) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            controller: controller,
            keyboardType: keyboard,
            obscureText: isObscureText ?? false,
            style:
                inputTextStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'tajawal',
                  fontWeight: FontWeight.w500,
                ),
            validator: validator,
            maxLines: maxLines ?? 1,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
                  hintStyle ??
                  TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 16.sp,
                    fontFamily: 'tajawal',
                  ),
              prefixIcon: prefixIcon != null
                  ? Container(
                      margin: EdgeInsets.all(5.w),
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: prefixIcon,
                    )
                  : null,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            ),
          ),
        ),
      ],
    );
  }
}
