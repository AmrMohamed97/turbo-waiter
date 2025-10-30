import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/theming/styles.dart';


class UIHelper {
  static BoxShadow shadow() {
    return BoxShadow(
      color: Colors.black.withAlpha((0.5 * 255).round()),
      spreadRadius: -5,
      blurRadius: 10,
      offset: const Offset(0, 0),
    );
  }

  static void showSnakBar({
    String? title,
    required BuildContext context,
    required String message,
    required String iconPath,
  }) {
    AnimatedSnackBar(
      animationCurve: Curves.easeOutCirc,
      duration: const Duration(seconds: 6),
      animationDuration: const Duration(seconds: 3),
      builder: (context) => Container(
        padding: const EdgeInsets.all(13),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                children: [
                  if (title != null)
                    Column(
                      children: [
                        Text(
                          title,
                          style: TextStyles.font18WhiteBold.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyles.font14WhiteBold.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).show(
      context,
    );
  }

  static void showBackDialog(
      {required String message,
      required String title,
      required void Function()? onPressed,
      required BuildContext context}) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: TextStyles.font18WhiteBold.copyWith(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
        content: Text(
          message,
          style: TextStyles.font14WhiteBold,
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
                AppTexts.cancel,
              style: TextStyles.font16WhiteRegular.copyWith(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              dynamic pressaction;
              if (onPressed != null) pressaction = onPressed;
              pressaction();
              Navigator.of(context).pop();
            },
            child: Text(
              AppTexts.yes,
              style: TextStyles.font16WhiteRegular,
            ),
          ),
        ],
      ),
    );
  }
  static BoxDecoration liqiudBoxDecoration() {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.3),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}

class PrinterHelper {
  PrinterHelper(this.title) {
    log(title);
  }
  final String title;
}
