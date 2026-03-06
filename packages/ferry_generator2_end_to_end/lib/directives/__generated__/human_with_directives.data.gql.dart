// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// The query type for the schema.
class GHumanWithDirectivesData {
  const GHumanWithDirectivesData({
    this.human,
    required this.G__typename,
  });

  factory GHumanWithDirectivesData.fromJson(Map<String, dynamic> json) {
    return GHumanWithDirectivesData(
      human: json['human'] == null
          ? null
          : GHumanWithDirectivesData_human.fromJson(
              (json['human'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GHumanWithDirectivesData_human? human;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$humanValue = this.human;
    _$result['human'] = _$humanValue == null ? null : _$humanValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHumanWithDirectivesData copyWith({
    GHumanWithDirectivesData_human? human,
    bool humanIsSet = false,
    String? G__typename,
  }) {
    return GHumanWithDirectivesData(
      human: humanIsSet ? human : this.human,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanWithDirectivesData &&
            human == other.human &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, human, G__typename);
  }

  @override
  String toString() {
    return 'GHumanWithDirectivesData(human: $human, G__typename: $G__typename)';
  }
}

class GHumanWithDirectivesData_human {
  const GHumanWithDirectivesData_human({
    this.id,
    this.name,
    required this.G__typename,
  });

  factory GHumanWithDirectivesData_human.fromJson(Map<String, dynamic> json) {
    return GHumanWithDirectivesData_human(
      id: json['id'] == null ? null : (json['id'] as String),
      name: json['name'] == null ? null : (json['name'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? id;

  final String? name;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue == null ? null : _$idValue;
    final _$nameValue = this.name;
    _$result['name'] = _$nameValue == null ? null : _$nameValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GHumanWithDirectivesData_human copyWith({
    String? id,
    bool idIsSet = false,
    String? name,
    bool nameIsSet = false,
    String? G__typename,
  }) {
    return GHumanWithDirectivesData_human(
      id: idIsSet ? id : this.id,
      name: nameIsSet ? name : this.name,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GHumanWithDirectivesData_human &&
            id == other.id &&
            name == other.name &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, G__typename);
  }

  @override
  String toString() {
    return 'GHumanWithDirectivesData_human(id: $id, name: $name, G__typename: $G__typename)';
  }
}
