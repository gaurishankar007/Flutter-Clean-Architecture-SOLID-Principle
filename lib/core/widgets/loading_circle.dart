import 'package:flutter/material.dart';

class LoadingCircle extends StatefulWidget {
  final double strokeWidth;
  final double height;
  final double width;

  const LoadingCircle({
    super.key,
    this.strokeWidth = 4,
    this.height = 30,
    this.width = 30,
  });

  @override
  State<LoadingCircle> createState() => _LoadingCircleState();
}

class _LoadingCircleState extends State<LoadingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);

    colorAnimation = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.deepPurple,
          end: Colors.indigo,
        ),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.indigo,
          end: Colors.pink,
        ),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.pink,
          end: Colors.teal,
        ),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.teal,
          end: Colors.deepPurple,
        ),
        weight: 25,
      ),
    ]).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return CircularProgressIndicator(
              color: colorAnimation.value,
              strokeWidth: widget.strokeWidth,
            );
          },
        ),
      ),
    );
  }
}
