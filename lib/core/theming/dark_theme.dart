import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Zain',
  scaffoldBackgroundColor: const Color(0xFF250045),
  primaryColor: const Color(0xFF5F2DEE),
  highlightColor: const Color(0xFFB13BFF),
  secondaryHeaderColor: const Color(0xFFF2287E),
  brightness: Brightness.dark,
  canvasColor: Colors.white,
  cardColor: const Color(0xFF252525),
  hintColor: const Color(0xFF52575C),
  focusColor: const Color(0xFFADC4C8),
  iconTheme: const IconThemeData(color: Colors.white),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      surfaceTintColor: Colors.white,
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    },
  ),
  textTheme: TextTheme(
    labelLarge: TextStyle(fontSize: 30.sp, color: Colors.white),
    displayLarge: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 24.sp,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22.sp,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16.sp,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 17.sp,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 15.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(fontSize: 12.0.sp),
    bodyLarge: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: Colors.black,
    ),
  ),
);
