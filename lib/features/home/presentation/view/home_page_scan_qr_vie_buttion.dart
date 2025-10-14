import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class HomePageScanQrVewButton extends StatelessWidget {
  const HomePageScanQrVewButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      minimumSize: Size(0, 0),
      onPressed: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Lottie.asset(Assets.assetsqrLottieImg, height: 10.h),
          ),
          SizedBox(height: 10),
          Text(
            AppTexts.scanQr,
            style: TextStyles.font15BlackRegular,
            textAlign: TextAlign.center,
          ),
          //test ticket button
          // ElevatedButton(
          //   onPressed: () {
          //     context.pushNamed(Routes.ticketDetailsScreen, arguments: 23);
          //   },
          //   child: Text(AppTexts.scanQr),
          // ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
