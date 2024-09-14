import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final ImageProvider? imageProvider;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool circular;

  const ImageWidget({
    super.key,
    this.imageUrl = "",
    this.imageProvider,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.circular = false,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;

    Widget loadingWidget = SizedBox(
      height: height,
      width: width,
      child: const Center(child: CupertinoActivityIndicator()),
    );
    Widget errorWidget = SizedBox(
      height: height,
      width: width,
      child: const Icon(Icons.error_outline_rounded, color: Colors.red),
    );

    if (imageUrl.isNotEmpty) {
      child = Image(
        width: width,
        height: height,
        fit: fit,
        image: NetworkImage(imageUrl),
        errorBuilder: (context, error, stackTrace) => errorWidget,
      );
    } else if (imageProvider != null) {
      child = Image(
        width: width,
        height: height,
        image: imageProvider!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => errorWidget,
      );
    } else {
      child = loadingWidget;
    }

    if (circular) {
      child = ClipOval(child: child);
    } else if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }

    return child;
  }

  factory ImageWidget.circular({
    required double diameter,
    String imageUrl = "",
    ImageProvider? imageProvider,
  }) {
    return ImageWidget(
      height: diameter,
      width: diameter,
      fit: BoxFit.cover,
      circular: true,
      imageUrl: imageUrl,
      imageProvider: imageProvider,
    );
  }
}
