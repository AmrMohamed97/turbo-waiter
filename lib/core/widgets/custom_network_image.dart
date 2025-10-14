import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/helpers/assets.dart';
import 'package:turbo_waiter/core/networking/api_urls.dart';
// import 'package:turbo_waiter/core/theming/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imgUrl;
  final double? imageWidth, imageHeight, borderRadius;
  final BoxFit? fit;
  final BlendMode? colorBlendMode;
  final Color? color;
  final bool isWithUrl, isProfile;
  const CustomNetworkImage({
    super.key,
    required this.imgUrl,
    this.imageWidth,
    this.imageHeight,
    this.borderRadius,
    this.fit,
    this.colorBlendMode,
    this.color,
    this.isWithUrl = false,
    this.isProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        colorBlendMode: colorBlendMode,
        color: color,
        imageUrl: isWithUrl ? ApiUrls.url + imgUrl : imgUrl,
        width: imageWidth,
        height: imageHeight,
        fit: fit,
        placeholder: (context, url) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              color: Colors.white,
              // color: ColorsManager.mainColor,
            ),
            child: Center(
              child: isProfile
                  ? Icon(Icons.person, color: Colors.white, size: 5.w)
                  : Image.asset(Assets.logo),
            ),
          );
        },
        // progressIndicatorBuilder: (context, url, loadingProgress) {
        //   return Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Center(
        //       child: CircularProgressIndicator(
        //         color: ColorsManager.mainColor,
        //         value: loadingProgress.progress,
        //       ),
        //     ),
        //   );
        // },
        errorWidget: (BuildContext context, String url, Object? error) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.w),
              color: Colors.transparent,
            ),
            child: Center(
              child: Image.asset(
                Assets.logo,
                // color: ColorsManager.primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:turbo_waiter/core/theming/colors.dart';

// class CustomNetworkImage extends StatelessWidget {
//   final String imgUrl;
//   final double? imageWidth, imageHeight;
//   final double radius;
//   final BlendMode? blendMode;
//   final BoxFit? fit;
//   final Color? color;
//   const CustomNetworkImage({
//     super.key,
//     required this.imgUrl,
//     this.imageWidth,
//     this.imageHeight,
//     this.blendMode,
//     this.fit,
//     this.color,
//     this.radius = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       clipBehavior: Clip.hardEdge,
//       borderRadius: BorderRadius.circular(radius),
//       child: Image.network(
//         imgUrl,
//         excludeFromSemantics: true,        
//         colorBlendMode: blendMode,
//         color: color,
//         width: imageWidth,
//         height: imageHeight,
//         fit:fit?? BoxFit.fitWidth,
//         frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//           return child;
//         },
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) {
//             return child;
//           } else {
//             return const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: ColorsManager.mainColor,
//                 ),
//               ),
//             );
//           }
//         },
//         errorBuilder:
//             (BuildContext context, Object exception, StackTrace? stackTrace) {
//           return const Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.emoji_emotions_outlined,
//                   color: ColorsManager.mainColor,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
