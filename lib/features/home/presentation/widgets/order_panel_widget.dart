import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/home_cubit.dart';

class OrderPanelWidget extends StatelessWidget {
  const OrderPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header with logo and time
              _buildHeader(context),
              // Customer Information and Order Details
              Expanded(child: _buildOrderContent(context, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          // Time display
          Text(
            '6:13',
            style: TextStyles.font18WhiteBold.copyWith(fontSize: 18.sp),
          ),
          const Spacer(),
          // App Logo with glassmorphism effect
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Assets.images.appLogoWord.image(
              height: 30.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }

  Widget _buildOrderContent(BuildContext context, HomeLoaded state) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customer Information
          _buildCustomerSection(context, state),
          SizedBox(height: 16.h),
          // Order Type
          _buildOrderTypeSection(context, state),
          SizedBox(height: 24.h),
          // Order Details Table
          _buildOrderDetailsSection(context, state),
          SizedBox(height: 16.h),
          // Action Buttons
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildCustomerSection(BuildContext context, HomeLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.people, color: ColorsManager.orange2, size: 20.sp),
            SizedBox(width: 8.w),
            Text('العملاء', style: TextStyles.font16WhiteBold),
          ],
        ),
        SizedBox(height: 8.h),
        TextField(
          onChanged: (value) {
            context.read<HomeCubit>().updateCustomerName(value);
          },
          decoration: InputDecoration(
            hintText: 'test',
            hintStyle: TextStyles.font14WhiteBold.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderTypeSection(BuildContext context, HomeLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.restaurant_menu,
              color: ColorsManager.orange2,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text('نوع الطلب', style: TextStyles.font16WhiteBold),
          ],
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () {
            _showOrderTypeDialog(context);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.selectedOrderType,
                  style: TextStyles.font15WhiteMedium,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetailsSection(BuildContext context, HomeLoaded state) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('تفاصيل الطلب', style: TextStyles.font16WhiteBold),
          SizedBox(height: 8.h),
          // Table Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'الصنف',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.grayColor6,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'الكمية',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.grayColor6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'السعر',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.grayColor6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // Order Items
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: state.orderItems.isEmpty
                  ? Center(
                      child: Text(
                        'لا توجد عناصر في الطلب',
                        style: TextStyles.font15WhiteMedium.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.orderItems.length,
                      itemBuilder: (context, index) {
                        final item = state.orderItems[index];
                        return _buildOrderItemRow(context, item);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItemRow(BuildContext context, OrderItem item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.2),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(item.name, style: TextStyles.font14WhiteBold),
          ),
          Expanded(
            child: Text(
              item.quantity.toString(),
              style: TextStyles.font14WhiteBold,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${item.price.toStringAsFixed(2)} ر.س',
              style: TextStyles.font14WhiteBold,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().clearOrder();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
              ),
            ),
            child: Text('جديد', style: TextStyles.font16WhiteBold),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().onProceedToPayment();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
              ),
            ),
            child: Text('انتقل للدفع', style: TextStyles.font16WhiteBold),
          ),
        ),
      ],
    );
  }

  void _showOrderTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'اختر نوع الطلب',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOrderTypeOption(context, 'داخل المطعم'),
            _buildOrderTypeOption(context, 'توصيل'),
            _buildOrderTypeOption(context, 'استلام'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTypeOption(BuildContext context, String orderType) {
    return ListTile(
      title: Text(orderType),
      onTap: () {
        context.read<HomeCubit>().updateOrderType(orderType);
        Navigator.pop(context);
      },
    );
  }
}
