import 'package:flutter/material.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/resources/data_state.dart';

class CusSnackBar {
  late BuildContext context;
  init(BuildContext ctx) => context = ctx;

  snackThis({String message = "", Color color = kG500, DataState? data}) {
    if (data != null) {
      if (data is SuccessState) {
        if (message.isEmpty) return;
      } else {
        message = data.errorMsg ?? "";
        color = kR600;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
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
