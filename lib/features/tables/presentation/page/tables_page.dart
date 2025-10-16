import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turbo_waiter/features/home/presentation/pages/home_screen.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../gen/assets.gen.dart';
// import '../../home/screens/home_screen.dart'; // شاشة الطلب الرئيسية

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tables = List.generate(
      12,
      (index) => TableModel(
        id: index + 1,
        isReserved: index % 3 == 0, // كل ثالث طاولة محجوزة
      ),
    );

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
                      crossAxisCount: 4,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 1,
                    ),
                    itemCount: tables.length,
                    itemBuilder: (context, index) {
                      final table = tables[index];
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
        Assets.images.appLogoWord.image(height: 40.h),
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
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildTableCard(BuildContext context, TableModel table) {
    final isReserved = table.isReserved;

    return GestureDetector(
      onTap: () {
        if (isReserved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('الطاولة رقم ${table.id} محجوزة حالياً'),
              backgroundColor: ColorsManager.orange2,
            ),
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
                  Icon(
                    isReserved
                        ? Icons.event_busy_rounded
                        : Icons.event_available_rounded,
                    color: isReserved
                        ? ColorsManager.orange2
                        : Colors.white.withOpacity(0.85),
                    size: 40.sp,
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

  /// 🔹 انتقال متحرك إلى صفحة الطلب
  void _navigateToOrderScreen(BuildContext context, int tableId) {
    Navigator.of(context).push(_createSlideRoute(const HomeScreen()));
  }

  /// 🔹 تعريف حركة الانزلاق (Slide Transition)
  Route _createSlideRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // من اليمين إلى اليسار
        const end = Offset.zero;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}

class TableModel {
  final int id;
  final bool isReserved;

  TableModel({required this.id, required this.isReserved});
}
