import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turbo_waiter/core/helpers/app_initialization.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/routing/app_router.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Force landscape orientation for tablet
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return ResponsiveSizer(
      builder: (ctx, orientation, screenType) => MaterialApp(
        navigatorObservers: [routeObserver],
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: AppTexts.appName,
        theme: ThemeData(
          fontFamily: "tajawal",
          scaffoldBackgroundColor: Colors.white,
          // Optimize for tablet with larger touch targets
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 48), // Larger touch targets
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: const Size(100, 44),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
        // initialRoute: Routes.testScreen,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
