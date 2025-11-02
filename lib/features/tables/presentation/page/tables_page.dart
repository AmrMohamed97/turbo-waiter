import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/widgets/ui_helper.dart';
import 'package:turbo_waiter/features/home/presentation/pages/home_screen.dart';
import 'package:turbo_waiter/features/tables/domain/src/tabels.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../gen/assets.gen.dart';
import '../view/reserved_table_sheet.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF8C00), Color(0xFFDC143C), Color(0xFFB22222)],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 24.h),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: tempTables.length,
                    itemBuilder: (context, index) {
                      final table = tempTables[index];
                      return _buildTableCard(context, table);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: UIHelper.liqiudBoxDecoration().copyWith(
            color: Colors.white,
          ),
          child: Assets.images.appLogoWord.image(height: 40.h),
        ),
        const Spacer(),
        Text(
          'الطاولات',
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
        const Spacer(),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: UIHelper.liqiudBoxDecoration().copyWith(),
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  //show dialog for confirm logout
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,

                      title: Text('تأكيد الخروج'),
                      content: Text('هل أنت متأكد من أنك تريد الخروج؟'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text('الإلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                            context.pushReplacementNamed(Routes.loginScreen);
                          },
                          child: Text('الخروج'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.settings_power_sharp, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableCard(BuildContext context, TableModel table) {
    final isReserved = table.isReserved;

    return GestureDetector(
      onTap: () {
        if (isReserved) {
          // show model sheet for details options  and some operations
          showModalBottomSheet(
            isScrollControlled: true,
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
            ),
            showDragHandle: true,
            enableDrag: true,
            context: context,
            builder: (context) => ReservedTableSheet(table: table),
          );
        } else {
          _navigateToOrderScreen(context, table.id);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (isReserved)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorsManager.orange2.withOpacity(0.2),
                ),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isReserved ? Assets.svg.fork : Assets.svg.restaurantTable,
                    width: 40.sp,
                    height: 40.sp,
                    colorFilter: ColorFilter.mode(
                      isReserved
                          ? Colors.white.withValues(alpha: 0.85)
                          : ColorsManager.orange2,
                      BlendMode.srcIn,
                    ),
                  ),

                  SizedBox(height: 8.h),
                  Text(
                    'طاولة ${table.id}',
                    style: TextStyles.font16WhiteBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    isReserved ? 'محجوزة' : 'متاحة',
                    style: TextStyles.font14WhiteBold.copyWith(
                      color: isReserved
                          ? ColorsManager.orange2
                          : Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 انتقال متحرك مع تأثير الضباب والشفافية
  void _navigateToOrderScreen(BuildContext context, int tableId) {
    Navigator.of(context).push(_createBlurredSlideRoute(const HomeScreen()));
  }

  /// 🔹 حركة انزلاق + تأثير ضبابي زجاجي
  Route _createBlurredSlideRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 650),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      opaque: false, // للسماح بالشفافية
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final blurTween = Tween<double>(begin: 0.0, end: 8.0);
        final slideTween = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return Stack(
          children: [
            // الخلفية الضبابية
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blurTween.evaluate(animation),
                sigmaY: blurTween.evaluate(animation),
              ),
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),
            // صفحة الطلب
            SlideTransition(
              position: animation.drive(slideTween),
              child: FadeTransition(opacity: animation, child: child),
            ),
          ],
        );
      },
    );
  }
}

class TableModel {
  final int id;
  final bool isReserved;
  final ReservedUser? user;

  TableModel({required this.id, required this.isReserved, this.user});
}

class ReservedUser {
  final int userId;
  final String username;
  final String? fullName;

  ReservedUser({required this.userId, required this.username, this.fullName});
}
