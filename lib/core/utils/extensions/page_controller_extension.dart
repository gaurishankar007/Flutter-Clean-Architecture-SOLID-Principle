import 'package:flutter/material.dart';

extension PageControllerExtension on PageController {
  Future goBack() => previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
  Future moveForward() => nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
}
