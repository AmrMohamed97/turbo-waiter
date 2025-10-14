import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/widgets/custom_network_image.dart';

class MainCardFrame extends StatelessWidget {
  final Widget child;
  final String? image;
  const MainCardFrame({super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 96.w,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.w),
              topRight: Radius.circular(12.w),
            ),
            child: CustomNetworkImage(
              imgUrl: (image != null && image!.isNotEmpty) ? (image ?? "") : "",
              imageHeight: 20.h, // 40% of screen height
              imageWidth: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            top: 16.h,
            start: 0,
            end: 0,
            child: Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
