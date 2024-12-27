// Copyright (c) 2021 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical
// or instructional purposes related to programming, coding, application
// development, or information technology.  Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing, creation of
// derivative works, or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'package:flutter/material.dart';

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawCircle(canvas);
    drawOval(canvas);
    drawConcentricCircle(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawCircle(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke;

    double radius = 75.0;
    const Offset center = Offset(175, 100);
    canvas.drawCircle(center, radius, paint);
  }

  void drawOval(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke;

    const Offset center = Offset(175, 225);
    final oval = Rect.fromCenter(center: center, width: 250, height: 100);
    canvas.drawOval(oval, paint);
  }

  void drawConcentricCircle(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke;

    var concentricCircleRadius = 100.0;
    const center = Offset(150, 400);

    while (concentricCircleRadius > 0) {
      canvas.drawCircle(center, concentricCircleRadius, paint);
      concentricCircleRadius -= 30;
    }
  }
}
