class Reservation {
  Reservation({
    required this.startAt,
    required this.endAt,
  });

  DateTime startAt;
  DateTime endAt;

  int totalMinute(DateTime startAt, DateTime endAt) {
    var startDuration = Duration(hours: startAt.hour, minutes: startAt.minute);
    var endDuration = Duration(hours: endAt.hour, minutes: endAt.minute);
    return startDuration.inMinutes - endDuration.inMinutes;
  }
}
