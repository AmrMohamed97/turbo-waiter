import 'package:flutter/material.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';

class HomePageQrView extends StatelessWidget {
  const HomePageQrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.assetsqrImg,
          fit: BoxFit.cover,
          width: 130,
          height: 170,
          color: Colors.black.withValues(alpha: 0.75),
        ),
        Image.asset(
          Assets.assetsqrBorderImg,
          fit: BoxFit.fill,
          width: 240,
          height: 280,
          color: Colors.black.withValues(alpha: 0.65),
        ),
        Positioned(
          bottom: 75,
          child: SizedBox(
            height: 35,
            child: Image.asset(
              Assets.assetsqrLineImg,
              fit: BoxFit.cover,
              width: 170,
              height: 230,
            ),
          ),
        ),
      ],
    );
  }
}
