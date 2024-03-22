import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../core/utils/text_styles.dart';

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    if (error.isEmpty) return const SizedBox();

    return Container(
      margin: EdgeInsets.only(bottom: 40.propHeight),
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: mediumRegular(errorColor),
      ),
    );
  }
}
