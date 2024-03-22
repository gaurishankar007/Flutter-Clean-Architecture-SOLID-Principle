import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/extensions/context_extension.dart';

class ImageBuilder extends StatelessWidget {
  final String imageUrl;
  final ImageProvider? imageProvider;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool circular;

  const ImageBuilder({
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

    if (imageUrl.isNotEmpty) {
      child = CachedNetworkImage(
        height: height,
        width: width,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const CupertinoActivityIndicator(),
        errorWidget: (context, url, errorData) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: context.onSurfaceColor()),
              borderRadius: borderRadius,
              shape: circular ? BoxShape.circle : BoxShape.rectangle,
            ),
            child: Icon(Icons.error, color: errorColor, size: 12),
          );
        },
      );
    } else if (imageProvider != null) {
      child = Image(
        width: width,
        height: height,
        image: imageProvider!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: CupertinoActivityIndicator());
        },
      );
    } else {
      child = SizedBox(
        width: width,
        height: height,
        child: const Center(child: CupertinoActivityIndicator()),
      );
    }

    if (circular) {
      child = ClipOval(child: child);
    } else if (borderRadius != null) {
      child = ClipRRect(borderRadius: borderRadius!, child: child);
    }

    return child;
  }

  factory ImageBuilder.circular({
    required double diameter,
    String imageUrl = "",
    ImageProvider? imageProvider,
  }) {
    return ImageBuilder(
      height: diameter,
      width: diameter,
      fit: BoxFit.cover,
      circular: true,
      imageUrl: imageUrl,
      imageProvider: imageProvider,
    );
  }
}
