import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

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
        width: width,
        height: height,
        fit: fit,
        imageUrl: imageUrl,
        placeholder: (context, url) {
          return Center(child: CupertinoActivityIndicator());
        },
        errorWidget: (context, url, error) {
          return Center(child: Icon(Icons.hide_image_outlined, color: kP));
        },
      );
    } else if (imageProvider != null) {
      child = Image(
        width: width,
        height: height,
        image: imageProvider!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Center(child: CupertinoActivityIndicator());
        },
      );
    } else {
      child = SizedBox(
        width: width,
        height: height,
        child: Center(child: CupertinoActivityIndicator()),
      );
    }

    if (circular) {
      child = ClipOval(
        child: child,
      );
    } else if (borderRadius != null) {
      child = ClipRRect(
        borderRadius: borderRadius!,
        child: child,
      );
    }

    return child;
  }
}
