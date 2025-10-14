import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/theming/colors.dart';

// ignore: must_be_immutable
class DatePickerWithCustomWidget<cubit extends Cubit<states>, states>
    extends StatelessWidget {
  final Function(DateTime?)? saveDate;
  final Widget child;
  DateTime? monthYearDate;
  final bool isMonth;
  final DateTime? initDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color? color;
  final bool? showDayText;
  DatePickerWithCustomWidget({
    super.key,
    required this.saveDate,
    this.monthYearDate,
    this.isMonth = false,
    this.color,
    this.initDate,
    this.lastDate,
    this.firstDate,
    this.showDayText = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<cubit, states>(
      builder: (context, state) {
        return InkWell(
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

                    dialogTheme: DialogThemeData(backgroundColor: Colors.white),
                  ),
                  child: child!,
                );
              },
              confirmText: AppTexts.yes,
              cancelText: AppTexts.cancel,
            );
            monthYearDate = dateSelected;
            if (saveDate != null) {
              saveDate!(dateSelected);
            }
          },
          child: child,
        );
      },
    );
  }
}
