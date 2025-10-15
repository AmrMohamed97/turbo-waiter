import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../cubit/home_cubit.dart';
import 'action_button_widget.dart';
import 'category_card_widget.dart';

class MenuSectionWidget extends StatelessWidget {
  const MenuSectionWidget({super.key});

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
              // Top Action Buttons
              _buildActionButtons(context),
              // Search Bar
              _buildSearchBar(context, state),
              SizedBox(height: 16.h),
              // Category Grid
              _buildCategoryGrid(context, state),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          ActionButtonWidget(
            title: 'إضافة عميل',
            icon: Icons.person_add,
            color: ColorsManager.orange2,
            onTap: () {
              context.read<HomeCubit>().onAddCustomer();
            },
          ),
          SizedBox(width: 12.w),
          ActionButtonWidget(
            title: 'الطلبات السابقة',
            icon: Icons.history,
            color: ColorsManager.orange2,
            onTap: () {
              context.read<HomeCubit>().onViewPreviousOrders();
            },
          ),
          SizedBox(width: 12.w),
          ActionButtonWidget(
            title: 'كوبون',
            icon: Icons.local_offer,
            color: ColorsManager.orange2,
            onTap: () {
              context.read<HomeCubit>().onApplyCoupon();
            },
          ),
          SizedBox(width: 12.w),
          ActionButtonWidget(
            title: 'العروض',
            icon: Icons.percent,
            color: ColorsManager.orange2,
            onTap: () {
              context.read<HomeCubit>().onViewOffers();
            },
          ),
          SizedBox(width: 12.w),
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

  Widget _buildSearchBar(BuildContext context, HomeLoaded state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        onChanged: (value) {
          context.read<HomeCubit>().updateSearchQuery(value);
        },
        decoration: InputDecoration(
          hintText: 'ابحث هنا',
          hintStyle: TextStyles.font14WhiteBold.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withValues(alpha: 0.7),
            size: 20.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.6)),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.1),
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context, HomeLoaded state) {
    // Filter categories based on search query
    final filteredCategories = state.categories.where((category) {
      if (state.searchQuery.isEmpty) return true;
      return category.name.toLowerCase().contains(
        state.searchQuery.toLowerCase(),
      );
    }).toList();

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.8,
          ),
          itemCount: filteredCategories.length,
          itemBuilder: (context, index) {
            final category = filteredCategories[index];
            return CategoryCardWidget(
              category: category,
              onTap: () {
                context.read<HomeCubit>().onCategorySelected(category.id);
              },
            );
          },
        ),
      ),
    );
  }
}
