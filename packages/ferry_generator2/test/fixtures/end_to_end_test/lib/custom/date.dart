class CustomDate {
  final DateTime value;

  const CustomDate(this.value);

  @override
  String toString() => value.toIso8601String();
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
