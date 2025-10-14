import 'dart:io';

import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalCustomScaffold extends StatelessWidget {
  final String? title;
  final VoidCallback? onBackPressed;
  final Widget? body;
  final bool hideBackButton, showCartButton, centerTitle;
  final List<Widget>? actions;
  final Color? bgColor, appBarColor, iconColor, titleColor;
  final double? titleFontSize;
  const GlobalCustomScaffold({
    super.key,
    this.title,
    this.body,
    this.onBackPressed,
    this.hideBackButton = false,
    this.showCartButton = false,
    this.centerTitle = false,
    this.actions,
    this.bgColor,
    this.titleFontSize,
    this.appBarColor,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? Color(0xFFF5FAFD),
      appBar: AppBar(
        automaticallyImplyLeading: !hideBackButton,
        backgroundColor: appBarColor ?? ColorsManager.mainHomeColor,
        leadingWidth: 15.w,
        centerTitle: centerTitle,
        iconTheme: IconThemeData(color: iconColor ?? Colors.white),
        title: title != null
            ? Text(
                title!,
                style: TextStyles.font18BlackExtraBold.copyWith(
                  color: titleColor ?? Colors.white,
                  fontSize: (titleFontSize ?? 18).sp,
                ),
              )
            : null,
        // centerTitle: true,
        surfaceTintColor: Colors.transparent,
        actions: [...?actions],
        leading: hideBackButton
            ? null
            : InkWell(
                onTap: () {
                  if (onBackPressed != null) onBackPressed!();
                  context.pop();
                },
                child: Center(
                  child: Icon(
                    Platform.isIOS
                        ? Icons.arrow_back_ios_new
                        : Icons.arrow_back,
                    color: iconColor ?? Colors.white,
                    // size: 6.w,
                  ),
                ),
              ),
      ),
      body: body,
    );
  }
}
