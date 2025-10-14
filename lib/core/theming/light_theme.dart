import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData light = ThemeData(
  fontFamily: 'Zain',
  scaffoldBackgroundColor: const Color(0xFFF4F4F4),
  primaryColor: const Color(0xFF5F2DEE),
  highlightColor: const Color(0xFFB13BFF),
  secondaryHeaderColor: const Color(0xFFF2287E),
  brightness: Brightness.light,
  canvasColor: Colors.black,
  cardColor: Colors.white,
  focusColor: const Color(0xFFADC4C8),
  hintColor: const Color(0xFF52575C),
  iconTheme: const IconThemeData(color: Colors.black),
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
    labelLarge: TextStyle(fontSize: 30.sp, color: Colors.black),
    displayLarge: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 24.sp,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22.sp,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16.sp,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 17.sp,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 15.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(fontSize: 12.0.sp),
    bodyLarge: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: Colors.white,
    ),
  ),
);
