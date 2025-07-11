class Date implements Comparable<Date> {
  final int year;

  /// January is 1.
  final int month;

  /// First day is 1.
  final int day;

  Date(this.year, this.month, this.day);

  /// The current date
  static Date now({bool utc = false}) {
    var now = DateTime.now();
    if (utc) {
      now = now.toUtc();
    }
    return now.toDate();
  }

  /// Convert to a [DateTime].
  DateTime toDateTime({bool utc = false}) {
    if (utc) {
      return DateTime.utc(year, month, day);
    } else {
      return DateTime(year, month, day);
    }
  }

  @override
  int compareTo(Date other) {
    int d = year.compareTo(other.year);
    if (d != 0) {
      return d;
    }
    d = month.compareTo(other.month);
    if (d != 0) {
      return d;
    }
    return day.compareTo(other.day);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Date &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          month == other.month &&
          day == other.day;

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;

  @override
  String toString() {
    final yyyy = year.toString();
    final mm = month.toString().padLeft(2, '0');
    final dd = day.toString().padLeft(2, '0');

    return '$yyyy-$mm-$dd';
  }
}

extension DateTimeToDate on DateTime {
  Date toDate() => Date(year, month, day);
}
