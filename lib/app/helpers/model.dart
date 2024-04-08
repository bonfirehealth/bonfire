// ignore_for_file: avoid_dynamic_calls

// Package imports:

// Project imports:
import 'package:bonfirehealth/app/helpers/timestamp.dart';

/// `fromDateTimeJson` helper method converts the json object
/// into DateTime.
DateTime? fromDateTimeJson(dynamic timestamp) {
  if (timestamp != null) {
    if (timestamp.runtimeType == String) {
      return DateTime.parse(timestamp as String);
    } else if (timestamp.runtimeType == Timestamp) {
      return timestamp.toDate() as DateTime?;
    } else {
      return timestamp as DateTime;
    }
  }
  return null;
}

/// `toDateTimeJson` helper method sets the DateTime or String variable as Timestamp.
Timestamp? toDateTimeJson(dynamic datetime) {
  if (datetime != null) {
    if (datetime.runtimeType == String) {
      return Timestamp.fromDate(DateTime.parse(datetime as String));
    } else if (datetime.runtimeType == DateTime) {
      return Timestamp.fromDate(datetime as DateTime);
    } else {
      return datetime as Timestamp;
    }
  }
  return null;
}

/// `fromDateTimeListJson` helper method converts list of json objects
/// into list of `DateTime`.
List<DateTime?>? fromDateTimeListJson(dynamic jsonArray) {
  final list = <DateTime?>[];
  if (jsonArray != null) {
    jsonArray.asMap().forEach((int index, dynamic json) {
      final dateTime = fromDateTimeJson(json);
      list.add(dateTime);
    });
    return list;
  }
  return null;
}

/// `toDateTimeListJson` helper method converts list of `DateTime`
/// into list of json objects.
List<Timestamp?>? toDateTimeListJson(List<DateTime?>? list) {
  final jsonList = <Timestamp?>[];
  if (list != null) {
    list.asMap().forEach((int index, DateTime? datetime) {
      final timestamp = toDateTimeJson(datetime);
      jsonList.add(timestamp);
    });
    return jsonList;
  }
  return null;
}
