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
  }

  @override
  bool shouldRepaint(covariant BatteryPainter oldDelegate) {
    return oldDelegate.charge != charge;
  }
}
