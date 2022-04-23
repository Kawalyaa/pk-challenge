import 'dart:math';

import 'package:flutter/material.dart';

class IosClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  IosClockPainter(this.context, this.dateTime);

  List<double> clockOffset = [
    pi / 2,
    pi / 3,
    pi / 6,
    0,
    -pi / 6,
    -pi / 3,
    -pi / 2,
    -2 * pi / 3,
    -5 * pi / 6,
    pi,
    5 * pi / 6,
    2 * pi / 3
  ];

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Draw minute
    for (int i = 1; i < 60; i++) {
      if ([5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55].contains(i) == false) {
        double startX = centerX + size.width * 0.475 * cos((i * 6) * pi / 180);
        double startY = centerY + size.width * 0.475 * sin((i * 6) * pi / 180);
        double endX = centerX + size.width * 0.49 * cos((i * 6) * pi / 180);
        double endY = centerY + size.width * 0.49 * sin((i * 6) * pi / 180);

        canvas.drawLine(Offset(startX, startY), Offset(endX, endY),
            Paint()..color = Theme.of(context).primaryColor);
      }
    }

    // Draw time,
    // 12h
    clockOffset.asMap().forEach((i, e) {
      double hour12XText =
          centerX + size.width * .4 * cos(e); // * cos((12 * 30) * pi / 180);
      double hour12YText =
          centerY - size.width * .4 * sin(e); // * sin((12) * pi / 180);

      double hour12X =
          centerX + size.width * .475 * cos(e); // * cos((12 * 30) * pi / 180);
      double hour12Y =
          centerY + size.width * .475 * sin(e); // * sin((12) * pi / 180);

      double hour12Xx =
          centerX + size.width * 0.49 * cos(e); // * cos((12 * 30) * pi / 180);
      double hour12Yy =
          centerY + size.width * 0.49 * sin(e); // * sin((12) * pi / 180);

      TextSpan span = TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lato',
            fontSize: [0, 3, 6, 9].contains(i)
                ? size.width / 28.0
                : size.width / 28.0,
            fontWeight:
                [0, 3, 6, 9].contains(i) ? FontWeight.w600 : FontWeight.w400,
          ),
          text: i == 0
              ? '12am'
              : i == 6
                  ? '12pm'
                  : i == 3
                      ? '6am'
                      : i == 9
                          ? '6pm'
                          : i == 1
                              ? '2'
                              : i == 2
                                  ? '4'
                                  : i == 4
                                      ? '8'
                                      : i == 5
                                          ? '10'
                                          : i == 7
                                              ? '2'
                                              : i == 8
                                                  ? '4'
                                                  : i == 10
                                                      ? '8'
                                                      : i == 11
                                                          ? '10'
                                                          : i.toString());
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      canvas.rotate(pi / 2);
      tp.layout();
      tp.paint(
          canvas,
          Offset(hour12XText - (i == 0 ? 5.0 : 5.0),
              hour12YText - size.width - 8.0));
      canvas.rotate(-pi / 2);
      canvas.drawLine(
        Offset(hour12Y, hour12X),
        Offset(hour12Yy, hour12Xx),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = [0, 3, 6, 9].contains(i) ? 2 : 1,
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
