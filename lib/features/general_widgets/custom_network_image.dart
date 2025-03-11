import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_task/features/general_widgets/insta_image_viewer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.blendMode,
    this.borderReduis,
    this.isInsta = false,
    this.errorWidget,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BlendMode? blendMode;
  final double? borderReduis;
  final bool isInsta;
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    final child = CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      colorBlendMode: blendMode,
      errorListener: (error) {
        if (kDebugMode) {
          print("Error String is ################# ${error.toString()}");
        }
      },
      errorWidget: (context, url, error) {
        return errorWidget ??
            ColoredBox(
              color: Colors.grey.shade100,
              child: Icon(
                Icons.image,
                color: Colors.grey,
                size: (height ?? width ?? 100) * 0.5,
              ),
            );
      },
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderReduis ?? 10),
      child: isInsta ? InstaImageViewer(imageUrl: imageUrl, child: child) : child,
    );
  }
}
