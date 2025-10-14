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

  /// File path: assets/images/backIcon.png
  AssetGenImage get backIconPng =>
      const AssetGenImage('assets/images/backIcon.png');

  /// File path: assets/images/back_icon.png
  AssetGenImage get backIconPng_ =>
      const AssetGenImage('assets/images/back_icon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/notAuth.png
  AssetGenImage get notAuth => const AssetGenImage('assets/images/notAuth.png');

  /// File path: assets/images/qr.png
  AssetGenImage get qr => const AssetGenImage('assets/images/qr.png');

  /// File path: assets/images/qrBorder.png
  AssetGenImage get qrBorder =>
      const AssetGenImage('assets/images/qrBorder.png');

  /// File path: assets/images/qr_line.png
  AssetGenImage get qrLine => const AssetGenImage('assets/images/qr_line.png');

  /// File path: assets/images/sign_up_image.png
  AssetGenImage get signUpImage =>
      const AssetGenImage('assets/images/sign_up_image.png');

  /// File path: assets/images/successImage.png
  AssetGenImage get successImage =>
      const AssetGenImage('assets/images/successImage.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    backIconPng,
    backIconPng_,
    logo,
    notAuth,
    qr,
    qrBorder,
    qrLine,
    signUpImage,
    successImage,
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

  /// List of all assets
  List<String> get values => [qrLottie];
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
