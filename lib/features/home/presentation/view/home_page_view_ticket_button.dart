import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class HomePageViewTicketButton extends StatelessWidget {
  const HomePageViewTicketButton({
    super.key,
    this.onPressed,
    this.borderRadius,
  });

  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      minimumSize: const Size(0, 0),
      onPressed: onPressed,
      child: UnconstrainedBox(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 3.w),

          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(2.w),
            gradient: const LinearGradient(
              colors: [Color(0xFF000000), Color(0xFF1e1e1e), Color(0xFF4d4d4d)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // borderRadius: bubbleRadius,
          ),
          child: Text(
            AppTexts.displayTicket,
            style: TextStyles.font15BlackBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
