import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/spacing.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

class DropDownSearchWidget<T> extends StatelessWidget {
  final bool loading;

  final List<T> items;
  final String hint;
  final String? title, errorMessage;
  final String Function(T)? selectedItemName;
  final T? selectedItem;
  final void Function(T?)? onChanged;
  final bool Function(T, String)? filterFn;
  final bool? absorbing;
  final Widget Function(BuildContext, T, bool, bool)? itemBuilder;
  final Widget? icon;
  final Widget Function(BuildContext, T?)? dropdownBuilder;
  final bool autoFocus;
  final double? borderRadius, borderWidth;
  final TextStyle? labelStyle, hintStyle, inputTextStyle;
  final Color? borderColor;
  final Widget? prefix;
  final EdgeInsets? contentPadding;
  const DropDownSearchWidget({
    super.key,
    required this.loading,
    required this.items,
    required this.hint,
    this.title,
    this.errorMessage,
    this.selectedItemName,
    required this.onChanged,
    this.filterFn,
    this.selectedItem,
    this.absorbing,
    this.itemBuilder,
    this.icon,
    this.dropdownBuilder,
    this.autoFocus = true,
    this.labelStyle,
    this.hintStyle,
    this.inputTextStyle,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.prefix,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing ?? loading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            verticalSpace(1),
            Text(title!, style: labelStyle ?? TextStyles.font15BlackBold),
            verticalSpace(1),
          ],

          DropdownSearch<T>(
            compareFn: (T item1, T item2) {
              if (item1 is String && item2 is String) {
                return item1 == item2;
              } else if (item1 is int && item2 is int) {
                return item1 == item2;
              } else {
                return false;
              }
            },

            decoratorProps: DropDownDecoratorProps(
              baseStyle:
                  inputTextStyle ??
                  TextStyles.font16fontGreyBold.copyWith(color: Colors.black),

              decoration: InputDecoration(
                prefixIcon: prefix,
                contentPadding: contentPadding,
                hintText: hint,
                hintStyle: hintStyle ?? TextStyles.font16fontGreyMedium
                  ..copyWith(color: Colors.black),

                fillColor: errorMessage != null
                    ? const Color.fromARGB(255, 247, 216, 216)
                    : Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 4.5.w),
                  borderSide: BorderSide(
                    color: borderColor ?? ColorsManager.gray1_5,
                    width: borderWidth ?? 1.3,
                  ),
                ),
              ),
            ),

            // dropdownButtonProps: icon != null
            //     ? const DropdownButtonProps(
            //         icon: Icon(Icons.search),
            //       )
            //     : const DropdownButtonProps(),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              itemBuilder: itemBuilder,
              searchFieldProps: TextFieldProps(
                autofocus: autoFocus,
                autocorrect: true,
              ),
            ),
            items: (String s, l) async => items.isNotEmpty ? items : [],
            onChanged: onChanged,
            selectedItem: selectedItem,
            itemAsString: selectedItemName,
            filterFn: filterFn,
            dropdownBuilder: dropdownBuilder,
          ),
          if (errorMessage != null)
            Text(
              errorMessage!,
              style: TextStyles.font12RedBold.copyWith(fontSize: 15.sp),
            ),
          if (loading)
            const LinearProgressIndicator(color: ColorsManager.blueIconColor),
          verticalSpace(1),
        ],
      ),
    );
  }
}
