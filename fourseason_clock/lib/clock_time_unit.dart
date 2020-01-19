import 'package:digital_clock/constants.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class ClockTimeUnit extends StatelessWidget {
  ClockTimeUnit({
    @required this.unitDesc,
    @required this.unitValue,
  });

  final String unitDesc;
  final String unitValue;
  static WeatherCondition weather;
  static bool is24H;

  @override
  Widget build(BuildContext context) {
    Color _lineColor = kClockThemePerWeather[weather][0];
    Color _completeColor = kClockThemePerWeather[weather][1];
    Color _textColor = kClockThemePerWeather[weather][2];

    int _unitMax = unitDesc == 'hours' ? (is24H ? 24 : 12) : 60;

    List<Color> _colors = [_textColor, _lineColor, _completeColor];
    int _intValue = int.parse(unitValue);

    // set Clock numbers opacity
    double opacity = (unitDesc == 'hours'
        ? (is24H ? _intValue / _unitMax : _intValue / _unitMax)
        : _intValue / _unitMax);

    return CustomPaint(
      foregroundPainter: CircleProgressPainter(
          colors: _colors,
          completePercent: _intValue,
          unitMax: _unitMax,
          is24H: is24H),
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Text(
          unitValue,
          style: TextStyle(
            fontSize: kTimeUnitFontSize,
            fontWeight: FontWeight.bold,
            color: _textColor.withOpacity(
              opacity,
            ),
          ),
        ),
      ),
    );
  }
}

// Circle progress painter
class CircleProgressPainter extends CustomPainter {
  List<Color> colors;
  int completePercent;
  int unitMax;
  bool is24H;

  CircleProgressPainter({
    this.colors,
    this.completePercent,
    this.unitMax,
    this.is24H,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = new Paint()
      ..color = colors[1]
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = kStokeWidth;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(
      center,
      radius,
      linePaint,
    );

    Paint completePaint = new Paint()
      ..shader = LinearGradient(
        colors: colors,
      ).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = kStokeWidth;

    double arcAngle = 2 * pi * (completePercent / unitMax);

    canvas.drawArc(
      new Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi / 2,
      arcAngle,
      false,
      completePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
