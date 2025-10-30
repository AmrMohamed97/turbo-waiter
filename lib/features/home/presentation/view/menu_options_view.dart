import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/features/home/presentation/cubit/home_cubit.dart';
import 'package:turbo_waiter/features/home/presentation/widgets/action_button_widget.dart';

class MenuOptionsView extends StatelessWidget {
  const MenuOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          // ActionButtonWidget(
          //   title: 'إضافة عميل',
          //   icon: Icons.person_add,
          //   color: ColorsManager.orange2,
          //   onTap: () {
          //     context.read<HomeCubit>().onAddCustomer();
          //   },
          // ),
          // SizedBox(width: 12.w),
          // ActionButtonWidget(
          //   title: 'الطلبات السابقة',
          //   icon: Icons.history,
          //   color: ColorsManager.orange2,
          //   onTap: () {
          //     context.read<HomeCubit>().onViewPreviousOrders();
          //   },
          // ),
          // SizedBox(width: 12.w),
          // ActionButtonWidget(
          //   title: 'كوبون',
          //   icon: Icons.local_offer,
          //   color: ColorsManager.orange2,
          //   onTap: () {
          //     context.read<HomeCubit>().onApplyCoupon();
          //   },
          // ),
          // SizedBox(width: 12.w),
          // ActionButtonWidget(
          //   title: 'العروض',
          //   icon: Icons.percent,
          //   color: ColorsManager.orange2,
          //   onTap: () {
          //     context.read<HomeCubit>().onViewOffers();
          //   },
          // ),
          // SizedBox(width: 12.w),
          Expanded(flex: 6, child: SizedBox()),
          ActionButtonWidget(
            title: 'اغلاق الوردية',
            icon: Icons.power_settings_new,
            color: ColorsManager.red1,
            onTap: () {
              context.read<HomeCubit>().onEndShift();
            },
          ),
        ],
      ),
    );
  }
}
