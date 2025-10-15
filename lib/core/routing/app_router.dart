import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/di/dependancy_injection.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/core/widgets/coming_soon_screen.dart';
import 'package:turbo_waiter/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:turbo_waiter/features/auth/presentation/screens/login_screen.dart';
import 'package:turbo_waiter/features/home/presentation/pages/home_screen.dart';
import 'package:turbo_waiter/features/splash/presentation/logic/splash_cubit.dart';
import 'package:turbo_waiter/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashScreen(),
          ),
        );
      case Routes.loginScreen:
        Map<String, dynamic>? params =
            settings.arguments as Map<String, dynamic>?;
        bool? backAfterSuccess = params?['backAfterSuccess'] as bool?;
        bool? canReturn = params?['canReturn'] as bool?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: LoginScreen(
              backAfterSuccess: backAfterSuccess ?? false,
              canReturn: canReturn ?? false,
            ),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case Routes.qrCodeScannerScreen:
      //   Map<String, dynamic>? params =
      //       settings.arguments as Map<String, dynamic>?;
      //   TicketStatusCubit ticketStatusCubit =
      //       params?['ticketStatusCubit'] as TicketStatusCubit;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: ticketStatusCubit,
      //       child: QrCodeScannerScreen(),
      //     ),
      //   );
      // case Routes.ticketStatusPage:
      //   Map<String, dynamic>? params =
      //       settings.arguments as Map<String, dynamic>?;
      //   TicketStatusCubit ticketStatusCubit =
      //       params?['ticketStatusCubit'] as TicketStatusCubit;
      //   int id = params?['id'] as int;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: ticketStatusCubit..checkTicketStatus(ticketId: id),
      //       child: TicketStatusPage(ticketId: id),
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (_) => const ComingSoonScreen());
    }
  }
}
