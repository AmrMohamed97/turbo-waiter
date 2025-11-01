import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/features/home/presentation/cubit/home_cubit.dart';
import 'package:turbo_waiter/features/home/presentation/widgets/sub_category_card_widget.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return state is HomeLoaded
            ? Expanded(
                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.clearSubCategories();
                      },
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 12.h,
                                childAspectRatio: 0.8,
                              ),
                          itemCount: state.subCategories.length,
                          itemBuilder: (context, index) {
                            final subCategory = state.subCategories[index];
                            return SubCategoryCardWidget(
                              subCategory: subCategory,
                              onTap: () {
                                cubit.onSubCategorySelected(subCategory);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
