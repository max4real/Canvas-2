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
import 'dart:math' as math;

class BatteryPainter extends CustomPainter {
  final margin = 30.0; // The space between the battery and the parent widget
  final padding = 10.0; // The space between the charge & pin and the border
  final pinWidth = 22.0; // The width of the pin
  final minCharge = 0.2; // The minimum charge until the battery disappears
  final double charge;
  final borderPaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke;

  final pinPaint = Paint()
    ..color = Colors.black
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  final chargePaint = Paint()
    ..color = Colors.greenAccent[700]!
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  BatteryPainter({required this.charge});

  @override
  void paint(Canvas canvas, Size size) {
    // Battery border
    final bdr = _borderRRect(size);
    canvas.drawRRect(bdr, borderPaint);

    // Battery pin
    final pinRect = _pinRect(bdr);
    canvas.drawArc(pinRect, math.pi / 2, -math.pi, true, pinPaint);

    // Battery charge progress
    final chargeRRect = _chargeRRect(bdr);
    canvas.drawRRect(chargeRRect, chargePaint);
  }

  RRect _borderRRect(Size size) {
    // 1
    final symmetricalMargin = margin * 2;
    // 2
    final width = size.width - symmetricalMargin - padding - pinWidth;
    // 3
    final height = width / 2;
    // 4
    final top = (size.height / 2) - (height / 2);
    // 5
    final radius = Radius.circular(height * 0.2);
    // 6
    final bounds = Rect.fromLTWH(margin, top, width, height);
    // 7
    return RRect.fromRectAndRadius(bounds, radius);
  }

  Rect _pinRect(RRect bdr) {
    // 1
    final center = Offset(bdr.right + padding, bdr.top + (bdr.height / 2.0));
    // 2
    final height = bdr.height * 0.38;
    // 3
    final width = pinWidth * 2;
    // 4
    return Rect.fromCenter(center: center, width: width, height: height);
  }

  RRect _chargeRRect(RRect bdr) {
    final percent = minCharge * ((charge / minCharge).round());
    final left = bdr.left + padding;
    final top = bdr.top + padding;
    final right = bdr.right - padding;
    final bottom = bdr.bottom - padding;
    final height = bottom - top;
    final width = right - left;
    final radius = Radius.circular(height * 0.15);
    final rect = Rect.fromLTWH(left, top, width * percent, height);
    return RRect.fromRectAndRadius(rect, radius);
  }

  @override
  bool shouldRepaint(covariant BatteryPainter oldDelegate) {
    return oldDelegate.charge != charge;
  }
}
