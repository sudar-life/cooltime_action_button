import 'dart:math';

import 'package:flutter/material.dart';

class ProgressAnimateContainer extends StatelessWidget {
  final Widget child;
  final double progress;
  final double width;
  final double height;
  ProgressAnimateContainer(
      {Key key, this.progress, this.width, this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: CustomPaint(
        painter: ProgressAnimatePainter(progress),
        child: child,
      ),
    );
  }
}

class ProgressAnimatePainter extends CustomPainter {
  double progress;
  ProgressAnimatePainter(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.grey.withOpacity(0.8);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    Offset center = Offset(size.width / 2, size.height / 2);
    double arcAngle = 2 * pi * (progress);

    canvas.drawArc(Rect.fromCircle(center: center, radius: 100), -pi / 2,
        arcAngle, true, paint);
  }

  @override
  bool shouldRepaint(ProgressAnimatePainter oldDelegate) {
    return this.progress != oldDelegate.progress;
  }
}
