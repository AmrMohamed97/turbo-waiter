import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_waiter/core/di/dependancy_injection.dart';
import 'package:turbo_waiter/core/helpers/app_constants.dart';
import 'package:turbo_waiter/core/helpers/bloc_observer.dart';
import 'package:turbo_waiter/core/helpers/local_storage.dart';
// import 'package:turbo_waiter/firebase_options.dart';
import 'package:turbo_waiter/my_app.dart';

LocalStorage storage = LocalStorage();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<void> appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  // Configure for tablet experience
  await _configureTabletSettings();

  await setupGetIt();
  Platform.localeName;

  Locale startLocal = const Locale('ar', 'EG');

  bool containLang = await storage.containKey(AppConstants.langCode);

  if (containLang) {
    String lang = await storage.readSecureData(AppConstants.langCode);
    debugPrint('App language =======> $lang');
    if (lang == 'ar') {
      startLocal = const Locale('ar', 'EG');
    } else {
      startLocal = const Locale('en', 'US');
    }
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      path: 'assets/lang',
      startLocale: startLocal,
      useOnlyLangCode: true,
      child: DevicePreview(enabled: true, builder: (context) => MyApp()),
      // child: BlocProvider(
      //   create: (context) => getIt<ThemeCubit>(),
      //   child: MyApp(
      //     token: token,
      //     gradeId: gradeId,
      //   ),
      // ),
    ),
  );
}

/// Configure tablet-specific settings
Future<void> _configureTabletSettings() async {
  // Set preferred orientations for tablet
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Configure system UI overlay style for tablet
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // Set minimum window size for tablet (if supported)
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }
}
