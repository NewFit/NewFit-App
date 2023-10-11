class Reservation {
  Reservation({
    required this.startAt,
    required this.endAt,
  });

  DateTime startAt;
  DateTime endAt;

  int totalMinute() {
    return Duration(hours: endAt.hour, minutes: endAt.minute).inMinutes -
        Duration(hours: startAt.hour, minutes: startAt.minute).inMinutes;
  }
}
