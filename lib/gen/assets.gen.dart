// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon_circle_no_bg.png
  AssetGenImage get appIconCircleNoBg =>
      const AssetGenImage('assets/images/app_icon_circle_no_bg.png');

  /// File path: assets/images/app_icon_circlepng.png
  AssetGenImage get appIconCirclepng =>
      const AssetGenImage('assets/images/app_icon_circlepng.png');

  /// File path: assets/images/app_logo_fork.png
  AssetGenImage get appLogoFork =>
      const AssetGenImage('assets/images/app_logo_fork.png');

  /// File path: assets/images/app_logo_word.png
  AssetGenImage get appLogoWord =>
      const AssetGenImage('assets/images/app_logo_word.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appIconCircleNoBg,
    appIconCirclepng,
    appLogoFork,
    appLogoWord,
  ];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/ar.json
  String get ar => 'assets/lang/ar.json';

  /// File path: assets/lang/en.json
  String get en => 'assets/lang/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/qrLottie.json
  String get qrLottie => 'assets/lottie/qrLottie.json';

  /// File path: assets/lottie/restaurant_animation.json
  String get restaurantAnimation => 'assets/lottie/restaurant_animation.json';

  /// List of all assets
  List<String> get values => [qrLottie, restaurantAnimation];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/app_sparkle.svg
  String get appSparkle => 'assets/svg/app_sparkle.svg';

  /// File path: assets/svg/error.svg
  String get error => 'assets/svg/error.svg';

  /// File path: assets/svg/ticket.svg
  String get ticket => 'assets/svg/ticket.svg';

  /// List of all assets
  List<String> get values => [appSparkle, error, ticket];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
