import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() buttonOnTap;
  const EmptyData({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(),
    );
  }
}
