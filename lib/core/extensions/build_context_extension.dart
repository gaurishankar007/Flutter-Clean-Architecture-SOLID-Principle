import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../resources/data_state.dart';

extension BuildContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get height => size.height;
  double get width => size.width;

  double get statusHeight => MediaQuery.of(this).viewPadding.top;

  SystemUiOverlayStyle get sos =>
      Theme.of(this).appBarTheme.systemOverlayStyle!;

  ColorScheme get cs => Theme.of(this).colorScheme;

  snackThis({String message = "", Color color = kG500, DataState? data}) {
    if (data != null) {
      if (data is SuccessState) {
        if (message.isEmpty) return;
      } else {
        message = data.errorMsg ?? "";
        color = kR600;
      }
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
