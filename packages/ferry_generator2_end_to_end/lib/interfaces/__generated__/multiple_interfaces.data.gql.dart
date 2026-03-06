// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

/// The query type for the schema.
class GMultipleInterfacesData {
  const GMultipleInterfacesData({
    this.cThing,
    this.dThing,
    this.other,
    required this.G__typename,
  });

  factory GMultipleInterfacesData.fromJson(Map<String, dynamic> json) {
    return GMultipleInterfacesData(
      cThing: json['cThing'] == null
          ? null
          : GMultipleInterfacesData_cThing.fromJson(
              (json['cThing'] as Map<String, dynamic>)),
      dThing: json['dThing'] == null
          ? null
          : GMultipleInterfacesData_dThing.fromJson(
              (json['dThing'] as Map<String, dynamic>)),
      other: json['other'] == null
          ? null
          : GMultipleInterfacesData_other.fromJson(
              (json['other'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GMultipleInterfacesData_cThing? cThing;

  final GMultipleInterfacesData_dThing? dThing;

  final GMultipleInterfacesData_other? other;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$cThingValue = this.cThing;
    _$result['cThing'] = _$cThingValue == null ? null : _$cThingValue.toJson();
    final _$dThingValue = this.dThing;
    _$result['dThing'] = _$dThingValue == null ? null : _$dThingValue.toJson();
    final _$otherValue = this.other;
    _$result['other'] = _$otherValue == null ? null : _$otherValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMultipleInterfacesData copyWith({
    GMultipleInterfacesData_cThing? cThing,
    bool cThingIsSet = false,
    GMultipleInterfacesData_dThing? dThing,
    bool dThingIsSet = false,
    GMultipleInterfacesData_other? other,
    bool otherIsSet = false,
    String? G__typename,
  }) {
    return GMultipleInterfacesData(
      cThing: cThingIsSet ? cThing : this.cThing,
      dThing: dThingIsSet ? dThing : this.dThing,
      other: otherIsSet ? other : this.other,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMultipleInterfacesData &&
            cThing == other.cThing &&
            dThing == other.dThing &&
            this.other == other.other &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, cThing, dThing, other, G__typename);
  }

  @override
  String toString() {
    return 'GMultipleInterfacesData(cThing: $cThing, dThing: $dThing, other: $other, G__typename: $G__typename)';
  }
}

class GMultipleInterfacesData_cThing {
  const GMultipleInterfacesData_cThing({
    required this.id,
    required this.dField,
    required this.G__typename,
  });

  factory GMultipleInterfacesData_cThing.fromJson(Map<String, dynamic> json) {
    return GMultipleInterfacesData_cThing(
      id: (json['id'] as String),
      dField: (json['dField'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String dField;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['dField'] = this.dField;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMultipleInterfacesData_cThing copyWith({
    String? id,
    String? dField,
    String? G__typename,
  }) {
    return GMultipleInterfacesData_cThing(
      id: id ?? this.id,
      dField: dField ?? this.dField,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMultipleInterfacesData_cThing &&
            id == other.id &&
            dField == other.dField &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, dField, G__typename);
  }

  @override
  String toString() {
    return 'GMultipleInterfacesData_cThing(id: $id, dField: $dField, G__typename: $G__typename)';
  }
}

class GMultipleInterfacesData_dThing {
  const GMultipleInterfacesData_dThing({
    required this.id,
    required this.cField,
    required this.G__typename,
  });

  factory GMultipleInterfacesData_dThing.fromJson(Map<String, dynamic> json) {
    return GMultipleInterfacesData_dThing(
      id: (json['id'] as String),
      cField: (json['cField'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String cField;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['cField'] = this.cField;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMultipleInterfacesData_dThing copyWith({
    String? id,
    String? cField,
    String? G__typename,
  }) {
    return GMultipleInterfacesData_dThing(
      id: id ?? this.id,
      cField: cField ?? this.cField,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMultipleInterfacesData_dThing &&
            id == other.id &&
            cField == other.cField &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, cField, G__typename);
  }

  @override
  String toString() {
    return 'GMultipleInterfacesData_dThing(id: $id, cField: $cField, G__typename: $G__typename)';
  }
}

class GMultipleInterfacesData_other {
  const GMultipleInterfacesData_other({
    required this.id,
    required this.cField,
    required this.dField,
    required this.otherField,
    required this.G__typename,
  });

  factory GMultipleInterfacesData_other.fromJson(Map<String, dynamic> json) {
    return GMultipleInterfacesData_other(
      id: (json['id'] as String),
      cField: (json['cField'] as String),
      dField: (json['dField'] as String),
      otherField: (json['otherField'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String id;

  final String cField;

  final String dField;

  final String otherField;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['id'] = this.id;
    _$result['cField'] = this.cField;
    _$result['dField'] = this.dField;
    _$result['otherField'] = this.otherField;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMultipleInterfacesData_other copyWith({
    String? id,
    String? cField,
    String? dField,
    String? otherField,
    String? G__typename,
  }) {
    return GMultipleInterfacesData_other(
      id: id ?? this.id,
      cField: cField ?? this.cField,
      dField: dField ?? this.dField,
      otherField: otherField ?? this.otherField,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMultipleInterfacesData_other &&
            id == other.id &&
            cField == other.cField &&
            dField == other.dField &&
            otherField == other.otherField &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, cField, dField, otherField, G__typename);
  }

  @override
  String toString() {
    return 'GMultipleInterfacesData_other(id: $id, cField: $cField, dField: $dField, otherField: $otherField, G__typename: $G__typename)';
  }
}
