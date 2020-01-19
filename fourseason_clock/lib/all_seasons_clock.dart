// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:digital_clock/clock_time_unit.dart';

import 'dart:ui';

enum _Element {
  background,
  text,
  shadow,
}

final _lightTheme = {
  _Element.background: Color(0xFF81B3FE),
  _Element.text: Colors.white,
  _Element.shadow: Colors.black,
};

/// A basic digital clock.
///
/// You can do better than this!
class AllSeasonClock extends StatefulWidget {
  const AllSeasonClock(this.model);

  final ClockModel model;

  @override
  _AllSeasonClockState createState() => _AllSeasonClockState();
}

class _AllSeasonClockState extends State<AllSeasonClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(AllSeasonClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      // _timer = Timer(
      //       Duration(minutes: 1) -
      //       Duration(seconds: _dateTime.second) -
      //       Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.

      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final bool is24H = widget.model.is24HourFormat ? true : false;
    final WeatherCondition weatherCondition = widget.model.weatherCondition;

    final minute = DateFormat('mm').format(_dateTime);
    final second = DateFormat('ss').format(_dateTime);

    ClockTimeUnit.weather = weatherCondition;
    ClockTimeUnit.is24H = is24H;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClockTimeUnit(
          unitDesc: enumToString(TimeUnit.hours),
          unitValue: hour,
        ),
        ClockTimeUnit(
          unitDesc: enumToString(TimeUnit.minutes),
          unitValue: minute,
        ),
        ClockTimeUnit(
          unitDesc: enumToString(TimeUnit.seconds),
          unitValue: second,
        ),
      ],
    );
  }
}
