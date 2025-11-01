import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/theming/styles.dart';
import 'package:turbo_waiter/features/tables/presentation/widgets/table_option_card.dart';
import 'package:turbo_waiter/features/tables/presentation/widgets/user_info_card.dart';
import '../page/tables_page.dart';

class ReservedTableSheet extends StatelessWidget {
  final TableModel table;

  const ReservedTableSheet({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ColorsManager.sheetGradient,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              // Title
              Text(
                'تفاصيل الطاولة ${table.id}',
                style: TextStyles.font21BlackBold.copyWith(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Two cards in a row (responsive: column on small screens)
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    // Stack vertically on small screens
                    return Column(
                      children: [
                        UserInfoCard(table: table),
                        SizedBox(height: 16.h),
                        const TableOptionsCard(),
                      ],
                    );
                  } else {
                    // Side by side on larger screens
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: UserInfoCard(table: table)),
                        SizedBox(width: 16.w),
                        Expanded(child: TableOptionsCard()),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}



