// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// import 'package:turbo_waiter/core/theming/colors.dart';
// import 'package:turbo_waiter/core/theming/styles.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class CustomDropDownWidget<T> extends StatelessWidget {
//   final ValueChanged onChanged;
//   final String hint;
//   final T? selectedValue;
//   final List<DropdownMenuItem<T>> dropdownMenuItemList;
//   final bool enabled;
//   final Color? color, iconColor, borderColor;
//   final Color? hintColor;
//   final Widget? selectedItemBuilder;
//   final EdgeInsetsGeometry? contentPadding;
//   final TextStyle? labelStyle, hintStyle, inputTextStyle;
//   final String? label;
//   final double? borderRadius;
//   const CustomDropDownWidget({
//     required this.onChanged,
//     required this.hint,
//     required this.selectedValue,
//     required this.dropdownMenuItemList,
//     this.enabled = true,
//     super.key,
//     this.color,
//     this.borderColor,
//     this.borderRadius,
//     this.iconColor,
//     this.hintColor,
//     this.selectedItemBuilder,
//     this.contentPadding,
//     this.label,
//     this.labelStyle,
//     this.hintStyle,
//     this.inputTextStyle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       spacing: 1.5.h,
//       children: [
//         if (label != null)
//           Text(label!, style: labelStyle ?? TextStyles.font15BlackBold),
//         AbsorbPointer(
//           absorbing: !enabled,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(borderRadius ?? 4.5.w),
//               ),
//               border: Border.all(
//                 color: borderColor ?? ColorsManager.gray1_5,
//                 width: 1.3,
//               ),
//               color: color ?? Colors.white,
//             ),
//             child: Padding(
//               padding:
//                   contentPadding ??
//                   EdgeInsetsDirectional.only(
//                     end: 3.5.w,
//                     // vertical: 1.h,
//                   ),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton2(
//                   dropdownStyleData: DropdownStyleData(
//                     decoration: BoxDecoration(color: Colors.white),
//                     maxHeight: 20.sh,
//                   ),
//                   hint: Text(
//                     hint,
//                     style: hintStyle ?? TextStyles.font16fontGreyMedium,
//                   ),
//                   isExpanded: true,
//                   style: inputTextStyle ?? TextStyles.font16fontGreyBold,
//                   iconStyleData: IconStyleData(
//                     icon: const Icon(Icons.keyboard_arrow_down_outlined),
//                     iconEnabledColor: iconColor ?? ColorsManager.fontGrey,
//                   ),
//                   selectedItemBuilder:
//                       selectedItemBuilder != null
//                           ? (context) {
//                             return dropdownMenuItemList.map((item) {
//                               return Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: selectedItemBuilder,
//                               );
//                             }).toList();
//                           }
//                           : null,
//                   items: dropdownMenuItemList,
//                   onChanged: onChanged,
//                   value: selectedValue,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
