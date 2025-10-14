import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShimmerContainer extends StatelessWidget {
  final double width, height, radius;
  final Color? color;
  const ShimmerContainer({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade400,
        borderRadius: BorderRadius.all(Radius.circular(radius.w)),
      ),
    );
  }
}
