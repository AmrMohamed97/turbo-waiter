import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../widgets/order_panel_widget.dart';
import '../widgets/menu_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFF8C00), // Orange from app icon
                Color(0xFFDC143C), // Red from app icon
                Color(0xFFB22222), // Darker red for depth
              ],
              stops: [0.0, 0.6, 1.0],
            ),
          ),
          child: SafeArea(
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
      ),
    );
  }
}
