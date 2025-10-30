import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/core/widgets/cashed_images.dart';
import 'package:turbo_waiter/core/widgets/ui_helper.dart';
import 'package:turbo_waiter/features/home/domain/entities/categories_entity.dart';
import '../../../../core/theming/styles.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/home_cubit.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryItemEntity category;
  final VoidCallback onTap;

  const CategoryCardWidget({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: UIHelper.liqiudBoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Category Image with Logo
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedImage(
                  url: category.imagePath,
                  fit: BoxFit.cover,
                  radius: 16,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  category.name,
                  style: TextStyles.font14WhiteBold.copyWith(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
