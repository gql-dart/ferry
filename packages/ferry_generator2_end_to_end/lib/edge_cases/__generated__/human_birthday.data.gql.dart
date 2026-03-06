// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:ferry_generator2_end_to_end/custom/date.dart';

/// The query type for the schema.
class GHumanBirthdayData {
  const GHumanBirthdayData({
    this.human,
    required this.G__typename,
  });

  factory GHumanBirthdayData.fromJson(Map<String, dynamic> json) {
    return GHumanBirthdayData(
      human: json['human'] == null
          ? null
          : GHumanBirthdayData_human.fromJson(
              (json['human'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GHumanBirthdayData_human? human;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$humanValue = this.human;
    _$result['human'] = _$humanValue == null ? null : _$humanValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHumanBirthdayData copyWith({
    GHumanBirthdayData_human? human,
    bool humanIsSet = false,
    String? G__typename,
  }) {
    return GHumanBirthdayData(
      human: humanIsSet ? human : this.human,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanBirthdayData &&
            human == other.human &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, human, G__typename);
  }

  @override
  String toString() {
    return 'GHumanBirthdayData(human: $human, G__typename: $G__typename)';
  }
}

class GHumanBirthdayData_human {
  const GHumanBirthdayData_human({
    required this.id,
    required this.name,
    required this.birthday,
    required this.G__typename,
  });

  factory GHumanBirthdayData_human.fromJson(Map<String, dynamic> json) {
    return GHumanBirthdayData_human(
      id: (json['id'] as String),
      name: (json['name'] as String),
      birthday: customDateFromJson(json['birthday']),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String name;

  final CustomDate birthday;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['name'] = this.name;
    _$result['birthday'] = customDateToJson(this.birthday);
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHumanBirthdayData_human copyWith({
    String? id,
    String? name,
    CustomDate? birthday,
    String? G__typename,
  }) {
    return GHumanBirthdayData_human(
      id: id ?? this.id,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanBirthdayData_human &&
            id == other.id &&
            name == other.name &&
            birthday == other.birthday &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, birthday, G__typename);
  }

  @override
  String toString() {
    return 'GHumanBirthdayData_human(id: $id, name: $name, birthday: $birthday, G__typename: $G__typename)';
  }
}
