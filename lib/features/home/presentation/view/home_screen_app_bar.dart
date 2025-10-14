import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
    this.bottomColor,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.surfaceTintColor,
    this.leading,
  });
  final Color? bottomColor, backgroundColor, foregroundColor, surfaceTintColor;
  final String title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: foregroundColor ?? Colors.transparent,
      surfaceTintColor: surfaceTintColor ?? Colors.transparent,
      title: Text(
        title,
        style: TextStyles.font18BlackBold.copyWith(fontSize: 20.sp),
      ),
      centerTitle: true,
      leading:
          leading ??
          CupertinoButton(
            padding: EdgeInsetsDirectional.only(start: 3.w),
            minimumSize: Size(0, 0),
            onPressed: () => context.pop(),
            child: Image.asset(
              Assets.assetsbackIconImg,
              color: Colors.black,
              fit: BoxFit.scaleDown,
              width: 30,
            ),
          ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 5,
                color: Theme.of(context).colorScheme.shadow,
                spreadRadius: -5,
              ),
            ],
            color: bottomColor ?? Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(26),
              topStart: Radius.circular(26),
            ),
          ),
          height: 25,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90);
}
