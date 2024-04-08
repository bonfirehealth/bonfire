// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/image_constant.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

enum StressLevel {
  veryLow,
  low,
  normal,
  high,
  veryHigh,
  unknown,
}

enum VitalSign {
  heartRate,
  heartRateVariability,
  respiratoryRate,
  stressIndex,
  readinessIndex,
  stressLevel,
  bloodPressure,
  oxygenSaturationLevel,
  oxygenLevel,
  temperature,
}

extension VitalSignExt on VitalSign {
  bool isNormal(double value, {double? secondaryValue}) {
    switch (this) {
      case VitalSign.heartRate:
        if (value >= 60 && value < 101) {
          return true;
        } else {
          return false;
        }
      case VitalSign.heartRateVariability:
        if (value >= 20 && value <= 200) {
          return true;
        } else {
          return false;
        }
      case VitalSign.respiratoryRate:
        if (value >= 12 && value <= 16) {
          return true;
        } else {
          return false;
        }
      case VitalSign.stressIndex:
        if (value <= 1.99) {
          return true;
        } else {
          return false;
        }
      case VitalSign.readinessIndex:
        if (value >= 50 && value <= 100) {
          return true;
        } else {
          return false;
        }
      case VitalSign.bloodPressure:
        if (value <= 140 && (secondaryValue ?? 0) <= 80) {
          return true;
        } else {
          return false;
        }
      case VitalSign.oxygenSaturationLevel:
        if (value >= 95) {
          return true;
        } else {
          return false;
        }
      case VitalSign.oxygenLevel:
        if (value >= 95) {
          return true;
        } else {
          return false;
        }
      case VitalSign.stressLevel:
        return true;
      case VitalSign.temperature:
        if (value >= 36.1 && value <= 37.2) {
          return true;
        } else {
          return false;
        }
    }
  }
}

enum AggregateInterval {
  oneDay,
  oneWeek,
  oneMonth,
  oneYear,
}

enum AggregateType {
  day,
  week,
  month,
  year,
  allTime,
}

enum ChartMode {
  readliness,
  bloodPressure,
}

class LogicHelper {
  LogicHelper._();

  static double calculateBodyMassIndex(double weight, double height) {
    return double.parse(
      ((weight / height / height) * 10000).toStringAsFixed(1),
    );
  }

  static StressLevel calculateStressLevel(double stressIndex) {
    // if (stressIndex < -1) {
    //   return StressLevel.low;
    // } else if (stressIndex >= -1 && stressIndex <= 1) {
    //   return StressLevel.normal;
    // } else if (stressIndex > 1) {
    //   return StressLevel.high;
    // } else if (stressIndex == -9999) {
    //   return StressLevel.unknown;
    // } else {
    //   return StressLevel.low;
    // }

    // This logic is for readiness index
    if (stressIndex < 0 || stressIndex > 100) {
      return StressLevel.unknown;
    } else if (stressIndex > 1 && stressIndex < 50) {
      return StressLevel.high;
    } else if (stressIndex >= 50 && stressIndex < 70) {
      return StressLevel.normal;
    } else {
      return StressLevel.low;
    }
  }

  static Widget getVitalSignReadingStatus(
    VitalSign vitalSign,
    double value, {
    double? secondaryValue = 0,
    double size = 25,
  }) {
    final passedIcon = AppImage.asset(
      ImageConstant.passed,
      width: size,
      height: size,
    );
    final warningIcon = AppImage.asset(
      ImageConstant.warning,
      width: size,
      height: size,
    );
    final isNormal = vitalSign.isNormal(value, secondaryValue: secondaryValue);
    return isNormal ? passedIcon : warningIcon;
  }

  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    final currentDay = dateTime.weekday;
    return dateTime.subtract(Duration(days: currentDay - 1));
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static DateTime findFirstDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month);
  }

  static DateTime findLastDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month + 1, 0);
  }

  static DateTime findFirstDateOfTheYear(DateTime dateTime) {
    return DateTime(dateTime.year);
  }

  static DateTime findLastDateOfTheYear(DateTime dateTime) {
    return DateTime(dateTime.year, 12, 31);
  }
}
