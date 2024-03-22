import 'package:flutter/material.dart';

import '../image_builder.dart';

class UserCircularImage extends StatelessWidget {
  final double diameter;
  const UserCircularImage({super.key, required this.diameter});

  @override
  Widget build(BuildContext context) {
    return ImageBuilder.circular(
      diameter: diameter,
      imageUrl: "https://images.unsplash.com/photo-1575936123452-b67c3203c357",
    );
  }
}
