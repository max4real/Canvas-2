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

class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawSquare(canvas);
    drawHome(canvas);
    drawHexagon(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawSquare(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    final square1 = Path();
    square1.moveTo(50, 150);
    square1.relativeLineTo(100, 0);
    square1.relativeLineTo(0, 100);
    square1.relativeLineTo(-100, 0);
    square1.close();

    const square2 = Rect.fromLTWH(200, 150, 50, 150);

    canvas.drawPath(square1, paint);
    canvas.drawRect(square2, paint);
  }

  void drawHexagon(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    final hexagon = Path();
    hexagon.moveTo(175, 400);
    hexagon.relativeLineTo(50, 50);
    hexagon.relativeLineTo(0, 50);
    hexagon.relativeLineTo(-50, 50);
    hexagon.relativeLineTo(-50, 0);
    hexagon.relativeLineTo(-50, -50);
    hexagon.relativeLineTo(0, -50);
    hexagon.relativeLineTo(50, -50);
    hexagon.close();

    canvas.drawPath(hexagon, paint);
  }

  void drawHome(Canvas canvas) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    final roof = Path();
    roof.moveTo(175, 0);
    roof.relativeLineTo(125, 150);
    roof.relativeLineTo(-250, 0);
    roof.close();

    final frame = Path();
    frame.moveTo(50, 150);
    frame.relativeLineTo(250, 0);
    frame.relativeLineTo(0, 200);
    frame.relativeLineTo(-250, 0);
    frame.close();

    final door = Path();
    door.moveTo(150, 250);
    door.relativeLineTo(50, 0);
    door.relativeLineTo(0, 100);
    door.relativeLineTo(-50, 0);
    door.close();

    canvas.drawPath(roof, paint);
    canvas.drawPath(frame, paint);
    canvas.drawPath(door, paint);
  }
}
