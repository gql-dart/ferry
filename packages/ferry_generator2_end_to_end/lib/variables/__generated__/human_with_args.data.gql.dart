// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// The query type for the schema.
class GHumanWithArgsData {
  const GHumanWithArgsData({
    this.human,
    required this.G__typename,
  });

  factory GHumanWithArgsData.fromJson(Map<String, dynamic> json) {
    return GHumanWithArgsData(
      human: json['human'] == null
          ? null
          : GHumanWithArgsData_human.fromJson(
              (json['human'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GHumanWithArgsData_human? human;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$humanValue = this.human;
    _$result['human'] = _$humanValue == null ? null : _$humanValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHumanWithArgsData copyWith({
    GHumanWithArgsData_human? human,
    bool humanIsSet = false,
    String? G__typename,
  }) {
    return GHumanWithArgsData(
      human: humanIsSet ? human : this.human,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanWithArgsData &&
            human == other.human &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, human, G__typename);
  }

  @override
  String toString() {
    return 'GHumanWithArgsData(human: $human, G__typename: $G__typename)';
  }
}

class GHumanWithArgsData_human {
  const GHumanWithArgsData_human({
    required this.name,
    this.height,
    required this.G__typename,
  });

  factory GHumanWithArgsData_human.fromJson(Map<String, dynamic> json) {
    return GHumanWithArgsData_human(
      name: (json['name'] as String),
      height: json['height'] == null ? null : (json['height'] as double),
      G__typename: (json['__typename'] as String),
    );
  }

  final String name;

  final double? height;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['name'] = this.name;
    final _$heightValue = this.height;
    _$result['height'] = _$heightValue == null ? null : _$heightValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHumanWithArgsData_human copyWith({
    String? name,
    double? height,
    bool heightIsSet = false,
    String? G__typename,
  }) {
    return GHumanWithArgsData_human(
      name: name ?? this.name,
      height: heightIsSet ? height : this.height,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanWithArgsData_human &&
            name == other.name &&
            height == other.height &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, height, G__typename);
  }

  @override
  String toString() {
    return 'GHumanWithArgsData_human(name: $name, height: $height, G__typename: $G__typename)';
  }
}
