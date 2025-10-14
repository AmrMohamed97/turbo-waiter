import 'package:flutter/material.dart';

class TabletResponsiveHelper {
  // Tablet-specific breakpoints
  static const double tabletMinWidth = 768.0;
  static const double tabletMaxWidth = 1024.0;
  static const double largeTabletMinWidth = 1024.0;

  // Check if current device is tablet
  static bool isTablet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= tabletMinWidth;
  }

  // Check if current device is large tablet
  static bool isLargeTablet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= largeTabletMinWidth;
  }

  // Get responsive font size for tablet
  static double getTabletFontSize(
    BuildContext context, {
    required double mobileSize,
    double? tabletSize,
    double? largeTabletSize,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletSize ?? (tabletSize ?? mobileSize * 1.3);
    } else if (isTablet(context)) {
      return tabletSize ?? (mobileSize * 1.2);
    }
    return mobileSize;
  }

  // Get responsive padding for tablet
  static EdgeInsets getTabletPadding(
    BuildContext context, {
    required EdgeInsets mobilePadding,
    EdgeInsets? tabletPadding,
    EdgeInsets? largeTabletPadding,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletPadding ??
          (tabletPadding ?? EdgeInsets.all(mobilePadding.horizontal * 1.5));
    } else if (isTablet(context)) {
      return tabletPadding ?? EdgeInsets.all(mobilePadding.horizontal * 1.3);
    }
    return mobilePadding;
  }

  // Get responsive spacing for tablet
  static double getTabletSpacing(
    BuildContext context, {
    required double mobileSpacing,
    double? tabletSpacing,
    double? largeTabletSpacing,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletSpacing ?? (tabletSpacing ?? mobileSpacing * 1.5);
    } else if (isTablet(context)) {
      return tabletSpacing ?? (mobileSpacing * 1.3);
    }
    return mobileSpacing;
  }

  // Get responsive width for tablet
  static double getTabletWidth(
    BuildContext context, {
    required double mobileWidth,
    double? tabletWidth,
    double? largeTabletWidth,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletWidth ?? (tabletWidth ?? mobileWidth * 1.4);
    } else if (isTablet(context)) {
      return tabletWidth ?? (mobileWidth * 1.2);
    }
    return mobileWidth;
  }

  // Get responsive height for tablet
  static double getTabletHeight(
    BuildContext context, {
    required double mobileHeight,
    double? tabletHeight,
    double? largeTabletHeight,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletHeight ?? (tabletHeight ?? mobileHeight * 1.3);
    } else if (isTablet(context)) {
      return tabletHeight ?? (mobileHeight * 1.1);
    }
    return mobileHeight;
  }

  // Get responsive border radius for tablet
  static double getTabletBorderRadius(
    BuildContext context, {
    required double mobileRadius,
    double? tabletRadius,
    double? largeTabletRadius,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletRadius ?? (tabletRadius ?? mobileRadius * 1.3);
    } else if (isTablet(context)) {
      return tabletRadius ?? (mobileRadius * 1.2);
    }
    return mobileRadius;
  }

  // Get responsive icon size for tablet
  static double getTabletIconSize(
    BuildContext context, {
    required double mobileSize,
    double? tabletSize,
    double? largeTabletSize,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletSize ?? (tabletSize ?? mobileSize * 1.4);
    } else if (isTablet(context)) {
      return tabletSize ?? (mobileSize * 1.3);
    }
    return mobileSize;
  }

  // Get responsive button size for tablet
  static Size getTabletButtonSize(
    BuildContext context, {
    required Size mobileSize,
    Size? tabletSize,
    Size? largeTabletSize,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletSize ??
          Size(mobileSize.width * 1.4, mobileSize.height * 1.3);
    } else if (isTablet(context)) {
      return tabletSize ??
          Size(mobileSize.width * 1.2, mobileSize.height * 1.1);
    }
    return mobileSize;
  }

  // Get responsive grid columns for tablet
  static int getTabletGridColumns(
    BuildContext context, {
    required int mobileColumns,
    int? tabletColumns,
    int? largeTabletColumns,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletColumns ?? (tabletColumns ?? mobileColumns + 2);
    } else if (isTablet(context)) {
      return tabletColumns ?? (mobileColumns + 1);
    }
    return mobileColumns;
  }

  // Get responsive aspect ratio for tablet
  static double getTabletAspectRatio(
    BuildContext context, {
    required double mobileRatio,
    double? tabletRatio,
    double? largeTabletRatio,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletRatio ?? (tabletRatio ?? mobileRatio * 1.2);
    } else if (isTablet(context)) {
      return tabletRatio ?? (mobileRatio * 1.1);
    }
    return mobileRatio;
  }

  // Get responsive max width for tablet
  static double getTabletMaxWidth(
    BuildContext context, {
    required double mobileMaxWidth,
    double? tabletMaxWidth,
    double? largeTabletMaxWidth,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletMaxWidth ?? (tabletMaxWidth ?? mobileMaxWidth * 1.5);
    } else if (isTablet(context)) {
      return tabletMaxWidth ?? (mobileMaxWidth * 1.3);
    }
    return mobileMaxWidth;
  }

  // Get responsive elevation for tablet
  static double getTabletElevation(
    BuildContext context, {
    required double mobileElevation,
    double? tabletElevation,
    double? largeTabletElevation,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletElevation ?? (tabletElevation ?? mobileElevation * 1.2);
    } else if (isTablet(context)) {
      return tabletElevation ?? (mobileElevation * 1.1);
    }
    return mobileElevation;
  }

  // Get responsive shadow blur for tablet
  static double getTabletShadowBlur(
    BuildContext context, {
    required double mobileBlur,
    double? tabletBlur,
    double? largeTabletBlur,
  }) {
    if (isLargeTablet(context)) {
      return largeTabletBlur ?? (tabletBlur ?? mobileBlur * 1.3);
    } else if (isTablet(context)) {
      return tabletBlur ?? (mobileBlur * 1.2);
    }
    return mobileBlur;
  }
}

// Extension for easier usage
extension TabletResponsiveExtension on BuildContext {
  bool get isTablet => TabletResponsiveHelper.isTablet(this);
  bool get isLargeTablet => TabletResponsiveHelper.isLargeTablet(this);

  double tabletFontSize(
    double mobileSize, {
    double? tabletSize,
    double? largeTabletSize,
  }) => TabletResponsiveHelper.getTabletFontSize(
    this,
    mobileSize: mobileSize,
    tabletSize: tabletSize,
    largeTabletSize: largeTabletSize,
  );

  EdgeInsets tabletPadding(
    EdgeInsets mobilePadding, {
    EdgeInsets? tabletPadding,
    EdgeInsets? largeTabletPadding,
  }) => TabletResponsiveHelper.getTabletPadding(
    this,
    mobilePadding: mobilePadding,
    tabletPadding: tabletPadding,
    largeTabletPadding: largeTabletPadding,
  );

  double tabletSpacing(
    double mobileSpacing, {
    double? tabletSpacing,
    double? largeTabletSpacing,
  }) => TabletResponsiveHelper.getTabletSpacing(
    this,
    mobileSpacing: mobileSpacing,
    tabletSpacing: tabletSpacing,
    largeTabletSpacing: largeTabletSpacing,
  );

  double tabletWidth(
    double mobileWidth, {
    double? tabletWidth,
    double? largeTabletWidth,
  }) => TabletResponsiveHelper.getTabletWidth(
    this,
    mobileWidth: mobileWidth,
    tabletWidth: tabletWidth,
    largeTabletWidth: largeTabletWidth,
  );

  double tabletHeight(
    double mobileHeight, {
    double? tabletHeight,
    double? largeTabletHeight,
  }) => TabletResponsiveHelper.getTabletHeight(
    this,
    mobileHeight: mobileHeight,
    tabletHeight: tabletHeight,
    largeTabletHeight: largeTabletHeight,
  );

  double tabletBorderRadius(
    double mobileRadius, {
    double? tabletRadius,
    double? largeTabletRadius,
  }) => TabletResponsiveHelper.getTabletBorderRadius(
    this,
    mobileRadius: mobileRadius,
    tabletRadius: tabletRadius,
    largeTabletRadius: largeTabletRadius,
  );

  double tabletIconSize(
    double mobileSize, {
    double? tabletSize,
    double? largeTabletSize,
  }) => TabletResponsiveHelper.getTabletIconSize(
    this,
    mobileSize: mobileSize,
    tabletSize: tabletSize,
    largeTabletSize: largeTabletSize,
  );

  Size tabletButtonSize(
    Size mobileSize, {
    Size? tabletSize,
    Size? largeTabletSize,
  }) => TabletResponsiveHelper.getTabletButtonSize(
    this,
    mobileSize: mobileSize,
    tabletSize: tabletSize,
    largeTabletSize: largeTabletSize,
  );

  int tabletGridColumns(
    int mobileColumns, {
    int? tabletColumns,
    int? largeTabletColumns,
  }) => TabletResponsiveHelper.getTabletGridColumns(
    this,
    mobileColumns: mobileColumns,
    tabletColumns: tabletColumns,
    largeTabletColumns: largeTabletColumns,
  );

  double tabletAspectRatio(
    double mobileRatio, {
    double? tabletRatio,
    double? largeTabletRatio,
  }) => TabletResponsiveHelper.getTabletAspectRatio(
    this,
    mobileRatio: mobileRatio,
    tabletRatio: tabletRatio,
    largeTabletRatio: largeTabletRatio,
  );

  double tabletMaxWidth(
    double mobileMaxWidth, {
    double? tabletMaxWidth,
    double? largeTabletMaxWidth,
  }) => TabletResponsiveHelper.getTabletMaxWidth(
    this,
    mobileMaxWidth: mobileMaxWidth,
    tabletMaxWidth: tabletMaxWidth,
    largeTabletMaxWidth: largeTabletMaxWidth,
  );

  double tabletElevation(
    double mobileElevation, {
    double? tabletElevation,
    double? largeTabletElevation,
  }) => TabletResponsiveHelper.getTabletElevation(
    this,
    mobileElevation: mobileElevation,
    tabletElevation: tabletElevation,
    largeTabletElevation: largeTabletElevation,
  );

  double tabletShadowBlur(
    double mobileBlur, {
    double? tabletBlur,
    double? largeTabletBlur,
  }) => TabletResponsiveHelper.getTabletShadowBlur(
    this,
    mobileBlur: mobileBlur,
    tabletBlur: tabletBlur,
    largeTabletBlur: largeTabletBlur,
  );
}
