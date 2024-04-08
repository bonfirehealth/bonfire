// Flutter imports:
import 'package:flutter/material.dart';

class DateTimeChartDataPoint {
  DateTimeChartDataPoint(
    this.x,
    this.y,
    this.name,
    this.color,
  );

  final DateTime x;
  final double y;
  final String name;
  final Color color;
}
