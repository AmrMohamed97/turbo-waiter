import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({super.key, this.body, this.appBar, this.resizeToAvoidBottomInset, this.extendBodyBehindAppBar, this.extendBody, this.backgroundColor, this.bottomNavigationBar, this.bottomSheet, this.floatingActionButton, this.drawer});
  final Widget? body,bottomNavigationBar,bottomSheet,floatingActionButton,drawer;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset,extendBodyBehindAppBar,extendBody;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar??false,
      extendBody: extendBody??false,
      appBar: appBar,
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
          child:body,
        ),
    );
  }
}