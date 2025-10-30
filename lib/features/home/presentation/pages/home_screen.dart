import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/widgets/screen_wrapper.dart';
import '../cubit/home_cubit.dart';
import '../widgets/order_panel_widget.dart';
import '../widgets/menu_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: ScreenWrapper(
        body: SafeArea(
          child: Row(
            children: [
              // Left Column - Order Panel
              Expanded(flex: 1, child: const OrderPanelWidget()),
              // Right Column - Menu Grid
              Expanded(flex: 2, child: const MenuSectionWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
