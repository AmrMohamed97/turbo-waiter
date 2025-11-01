import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/widgets/custom_dialog.dart';
import 'package:turbo_waiter/core/theming/colors.dart';
import 'package:turbo_waiter/core/widgets/primary_button.dart';

class ChooseCShift extends StatefulWidget {
  final Function(String)? onShiftSelected;

  const ChooseCShift({super.key, this.onShiftSelected});

  @override
  State<ChooseCShift> createState() => _ChooseCShiftState();
}

class _ChooseCShiftState extends State<ChooseCShift>
    with TickerProviderStateMixin {
  String? selectedShift;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectShift(String shift) {
    setState(() {
      selectedShift = shift;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    // Call the callback after a short delay to allow animation to complete
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onShiftSelected?.call(shift);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'يرجي تحديد الشيفت المناسب',
      children: [
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          itemCount: shifts.length,
          itemBuilder: (context, index) {
            final shift = shifts[index];
            return _buildShiftItem(shift);
          },
        ).expand(),
        // ...shifts.map((shift) => _buildShiftItem(shift)),
        // const SizedBox(height: 20),
        PrimaryButton(
          onPressed: () {
            context.pop();
            context.pushReplacementNamed(Routes.tablesPage);
          },
          buttonText: "التالي",
        ),
      ],
    );
  }

  Widget _buildShiftItem(String shift) {
    final isSelected = selectedShift == shift;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: isSelected ? _scaleAnimation.value : 1.0,
            child: GestureDetector(
              onTap: () => _selectShift(shift),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorsManager.primaryColor.withValues(alpha: 0.1)
                      : ColorsManager.gray1_4,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? ColorsManager.primaryColor
                        : ColorsManager.gray1_5,
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: ColorsManager.primaryColor.withValues(
                              alpha: 0.3,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: ColorsManager.blackColor1.withValues(
                              alpha: 0.05,
                            ),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      shift,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? ColorsManager.primaryColor
                            : ColorsManager.lightFontColor,
                        fontFamily: 'tajawal',
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? ColorsManager.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? ColorsManager.primaryColor
                              : ColorsManager.gray1_2,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> shifts = ['شيفت 1', 'شيفت 2', 'شيفت 3', 'شيفت 4', 'شيفت 5'];
