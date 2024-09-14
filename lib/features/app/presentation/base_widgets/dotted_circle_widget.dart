import 'dart:math';

import 'package:flutter/material.dart';

class DottedCircleWidget extends StatelessWidget {
  final double radius;
  final Color color;
  final int dotsNumber;

  const DottedCircleWidget({
    super.key,
    required this.radius,
    required this.color,
    required this.dotsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: CustomPaint(
        painter: DottedCirclePainter(
          strokeColor: color,
          strokeWidth: 2,
          dotsNumber: dotsNumber,
        ),
      ),
    );
  }
}

class DottedCirclePainter extends CustomPainter {
  Color strokeColor;
  double strokeWidth;
  int dotsNumber;

  DottedCirclePainter({
    required this.strokeColor,
    required this.strokeWidth,
    required this.dotsNumber,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = Paint()
      ..color = strokeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    /// If dotsNumber is 4,
    /// base angle = 360 / dotsNumber, sweep angle = 360 / (dotsNumber * 2)
    /// so that the length of dot and gap will be same
    double baseAngle = pi / (dotsNumber / 2);
    double sweepAngle = pi / dotsNumber;

    for (var i = 0; i < dotsNumber; i++) {
      var startAngle = baseAngle * i;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        complete,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
