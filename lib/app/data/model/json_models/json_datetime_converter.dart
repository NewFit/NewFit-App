import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime);
  }
}