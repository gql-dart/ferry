class CustomDate {
  final DateTime value;

  const CustomDate(this.value);

  @override
  String toString() => value.toIso8601String();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other case CustomDate(:final value)) {
      return this.value == value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;
}

CustomDate customDateFromJson(Object? input) {
  if (input is CustomDate) return input;
  if (input is String) {
    return CustomDate(DateTime.parse(input));
  }
  if (input is int) {
    return CustomDate(DateTime.fromMillisecondsSinceEpoch(input));
  }
  throw FormatException('Invalid date value: $input');
}

String customDateToJson(CustomDate date) => date.value.toIso8601String();
