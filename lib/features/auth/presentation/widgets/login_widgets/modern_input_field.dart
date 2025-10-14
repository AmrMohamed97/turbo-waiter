import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModernInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final ValueNotifier<bool>? obscureTextNotifier;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool required;

  const ModernInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    this.obscureTextNotifier,
    this.validator,
    this.keyboardType,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768;

    // Responsive font sizes
    final labelSize = isTablet ? 16.sp : 15.sp;
    final inputSize = isTablet ? 18.sp : 16.sp;
    final hintSize = isTablet ? 17.sp : 15.sp;
    final iconSize = isTablet ? 22.sp : 20.sp;

    // Responsive padding
    final horizontalPadding = isTablet ? 5.w : 4.w;
    final verticalPadding = isTablet ? 4.h : 3.h;
    final iconPadding = isTablet ? 3.w : 2.w;
    final iconMargin = isTablet ? 5.w : 4.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with white text to match splash theme
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: labelSize,
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

        SizedBox(height: 1.h),

        // Input field with glassmorphism effect
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.15),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword
                ? (obscureTextNotifier?.value ?? false)
                : false,
            keyboardType: keyboardType,
            validator: validator,
            style: TextStyle(
              color: Colors.white,
              fontSize: inputSize,
              fontFamily: 'tajawal',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: hintSize,
                fontFamily: 'tajawal',
              ),
              prefixIcon: Container(
                margin: EdgeInsets.all(iconMargin),
                padding: EdgeInsets.all(iconPadding),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(prefixIcon, color: Colors.white, size: iconSize),
              ),
              suffixIcon: isPassword
                  ? ValueListenableBuilder<bool>(
                      valueListenable:
                          obscureTextNotifier ?? ValueNotifier(false),
                      builder: (context, isObscured, child) {
                        return IconButton(
                          onPressed: () {
                            obscureTextNotifier?.value = !isObscured;
                          },
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white.withOpacity(0.7),
                            size: iconSize,
                          ),
                        );
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
