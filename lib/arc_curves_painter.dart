import 'dart:math' as math;

import 'package:flutter/material.dart';

class ArcsCurvesPainter extends CustomPainter {
  final curvesPaint = Paint()
    ..strokeWidth = 5
    ..color = Colors.blue
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    drawArc(canvas);
    drawQuadraticBezier(canvas);
    drawCubicBezier(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double degreesToRadians(double degrees) {
    return (degrees * math.pi) / 180;
  }

  void drawArc(Canvas canvas) {
    const center = Offset(50, 50);
    final radius = 50.0;
    final rect = Rect.fromCircle(center: center, radius: radius);

    double startAngle = degreesToRadians(-170);
    double sweepAngle = degreesToRadians(340);
    canvas.drawArc(rect, startAngle, sweepAngle, true, curvesPaint);
  }

  void drawQuadraticBezier(Canvas canvas) {
    final qCurve1 = Path()
      ..moveTo(100, 200)
      ..relativeQuadraticBezierTo(150, 0, 200, -150);
    canvas.drawPath(qCurve1, curvesPaint);

    final qCurve2 = Path()
      ..moveTo(50, 250)
      ..relativeQuadraticBezierTo(125, 200, 250, 0);
    canvas.drawPath(qCurve2, curvesPaint);
  }

  void drawCubicBezier(Canvas canvas) {
    final qCurve2 = Path()
      ..moveTo(50, 550)
      ..relativeCubicTo(50, -150, 200, -150, 250, 0);
    canvas.drawPath(qCurve2, curvesPaint);
  }
}
