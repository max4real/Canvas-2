import 'dart:math' as math;

import 'package:flutter/material.dart';

class PacMan extends StatefulWidget {
  const PacMan({super.key});

  @override
  _PacManState createState() => _PacManState();
}

class _PacManState extends State<PacMan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _startAngleAnimation;
  late Animation<double> _sweepAngleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);

    _startAngleAnimation = Tween<double>(
      begin: -135,
      end: -175,
    ).animate(_controller);

    _sweepAngleAnimation = Tween<double>(
      begin: 270,
      end: 345,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ArcsCurvesPainter2(
            startAngle: _startAngleAnimation.value,
            sweepAngle: _sweepAngleAnimation.value,
          ),
          child: Container(),
        );
      },
    );
  }
}

class ArcsCurvesPainter2 extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  ArcsCurvesPainter2({
    required this.startAngle,
    required this.sweepAngle,
  });

  final curvesPaint = Paint()
    ..strokeWidth = 5
    ..color = Colors.yellow
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    const center = Offset(150, 150);
    final radius = 100.0;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
      rect,
      degreesToRadians(startAngle),
      degreesToRadians(sweepAngle),
      true,
      curvesPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double degreesToRadians(double degrees) {
    return (degrees * math.pi) / 180;
  }
}
