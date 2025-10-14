import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/widgets/app_text_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(color: ColorsManager.mainPurple),
    ),
  );
}

void showSuccessDialog(
  BuildContext context, {
  required String titleText,
  String? bodyText,
  required Function() onPressed,
  VoidCallback? onGoToCartPressed,
  bool goToCart = false,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xfff4f4f4),
        title: Center(child: Text(titleText)),
        content: bodyText != null && bodyText.isNotEmpty
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  bodyText,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            : const SizedBox.shrink(),
        actions: <Widget>[
          Column(
            spacing: 1.h,
            children: [
              AppTextButton(
                horizontalPadding: 0,
                verticalPadding: 0,
                buttonHeight: 5,
                buttonText: AppTexts.success,
                backgroundColor: const Color.fromARGB(255, 56, 160, 60),
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                onPressed: () {
                  onPressed();
                },
              ),
              if (goToCart)
                AppTextButton(
                  horizontalPadding: 0,
                  verticalPadding: 0,
                  buttonHeight: 5,
                  buttonText: "go to cart",
                  backgroundColor: ColorsManager.primaryColor,
                  textStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                  onPressed: () {
                    if (onGoToCartPressed != null) onGoToCartPressed();
                  },
                ),
            ],
          ),
        ],
      );
    },
  );
}

void showErrorDialog(
  BuildContext context,
  String error, {
  bool isPop = false,
  Function()? onPressed,
  String? buttonText,
  bool? isWithCancelButton,
}) {
  if (isPop) {
    context.pop();
  }
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xfff4f4f4),
      icon: const Icon(Icons.error, color: Colors.red, size: 32),
      content: Text(
        error,
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      actions: [
        AppTextButton(
          horizontalPadding: 0,
          verticalPadding: 0,
          buttonHeight: 5,
          buttonText: buttonText ?? 'Cancel',
          backgroundColor: const Color.fromARGB(255, 204, 55, 45),
          textStyle: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 18.sp),
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
            context.pop();
          },
        ),
        if (isWithCancelButton != null && isWithCancelButton == true)
          AppTextButton(
            horizontalPadding: 0,
            verticalPadding: 0,
            buttonHeight: 5,
            buttonText: 'Cancel',
            backgroundColor: const Color.fromARGB(255, 204, 55, 45),
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: 20.sp,
            ),
            onPressed: () {
              context.pop();
            },
          ),
      ],
    ),
  );
}

// Generic function to display SnackBar
void showCustomSnackBar({
  required BuildContext context,
  required String message,
  required bool isError, // Default background color
  Duration duration = const Duration(seconds: 2), // Default duration
  // SnackBarAction? action, // Optional action
}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(fontSize: 16.sp)),
    backgroundColor: isError ? Colors.red : Colors.green,
    duration: duration,
    // action: action, // Optional action for buttons or undo
  );

  // Show the SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Future<String> getDeviceId() async {
//   String deviceId = "";
//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   if (Platform.isAndroid) {
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

//     deviceId = androidInfo.id; // Unique Android ID
//   } else if (Platform.isIOS) {
//     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

//     deviceId = iosInfo.identifierForVendor ?? ''; // Unique iOS ID
//   }
//   return deviceId;
// }


  // String formatDate(String date) {
  //   DateTime dateTime = DateTime.parse(date);
  //   String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  //   return formattedDate;
  // }
