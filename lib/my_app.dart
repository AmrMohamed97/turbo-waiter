import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/helpers/app_initialization.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/routing/app_router.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
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
        ),
        // initialRoute: Routes.testScreen,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
