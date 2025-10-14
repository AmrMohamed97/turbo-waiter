import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turbo_waiter/core/theming/styles.dart';

// ignore: must_be_immutable
class CustomDatePickerWidget<cubit extends Cubit<states>, states>
    extends StatelessWidget {
  final Function(DateTime?)? saveDate;
  DateTime? monthYearDate;
  final bool isMonth;
  final DateTime? initDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color? color, borderColor, iconColor;
  final bool? showDayText;
  final String title;
  final String? label;
  final double? verticalPadding, horizontalPadding, borderRadius;
  final TextStyle? labelStyle, hintStyle;
  CustomDatePickerWidget({
    super.key,
    required this.saveDate,
    required this.title,
    this.monthYearDate,
    this.isMonth = false,
    this.color,
    this.label,
    this.initDate,
    this.lastDate,
    this.firstDate,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
    this.borderColor,
    this.iconColor,
    this.labelStyle,
    this.hintStyle,
    this.showDayText = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<cubit, states>(
      builder: (context, state) {
        return Column(
          spacing: 1.5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Text(label!, style: labelStyle ?? TextStyles.font15BlackBold),
            InkWell(
              onTap: () async {
                DateTime? dateSelected;

                dateSelected = await showDatePicker(
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  currentDate: monthYearDate ?? dateSelected,
                  context: context,
                  initialDate: initDate ?? DateTime.now(),
                  firstDate: firstDate ?? DateTime(1800),
                  lastDate: lastDate ?? DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        datePickerTheme: DatePickerThemeData(
                          weekdayStyle: Theme.of(context).textTheme.bodyLarge,
                          headerHeadlineStyle: Theme.of(
                            context,
                          ).textTheme.bodyLarge,
                        ),
                        splashColor: Colors.white,
                        colorScheme: const ColorScheme.light(
                          primary: ColorsManager.mainColor,
                          onPrimary: Colors.white,
                          surface: Colors.white,
                        ),

                        dialogTheme: DialogThemeData(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      child: child!,
                    );
                  },
                  confirmText: AppTexts.ok,
                  cancelText: AppTexts.cancel,
                );
                monthYearDate = dateSelected;
                if (saveDate != null) {
                  saveDate!(dateSelected);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 4.w,
                  vertical: verticalPadding ?? 2.h,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    width: 0.4,
                    color: borderColor ?? ColorsManager.lightGray,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // if (state is state1 || monthYearDate != null)
                    Text(
                      monthYearDate != null
                          ? monthYearDate.toString().split(' ')[0].toString()
                          : title,
                      style: hintStyle ?? TextStyles.font16fontGreyMedium,
                    ),
                    SvgPicture.asset(
                      Assets.assetsSvgCalendar,
                      colorFilter: ColorFilter.mode(
                        iconColor ?? ColorsManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
