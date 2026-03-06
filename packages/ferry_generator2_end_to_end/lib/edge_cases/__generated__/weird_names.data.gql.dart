// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GWeirdNamesData {
  const GWeirdNamesData({
    this.weirdNames,
    required this.G__typename,
  });

  factory GWeirdNamesData.fromJson(Map<String, dynamic> json) {
    return GWeirdNamesData(
      weirdNames: json['weirdNames'] == null
          ? null
          : GWeirdNamesData_weirdNames.fromJson(
              (json['weirdNames'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GWeirdNamesData_weirdNames? weirdNames;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$weirdNamesValue = this.weirdNames;
    _$result['weirdNames'] =
        _$weirdNamesValue == null ? null : _$weirdNamesValue.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWeirdNamesData copyWith({
    GWeirdNamesData_weirdNames? weirdNames,
    bool weirdNamesIsSet = false,
    String? G__typename,
  }) {
    return GWeirdNamesData(
      weirdNames: weirdNamesIsSet ? weirdNames : this.weirdNames,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWeirdNamesData &&
            weirdNames == other.weirdNames &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, weirdNames, G__typename);
  }

  @override
  String toString() {
    return 'GWeirdNamesData(weirdNames: $weirdNames, G__typename: $G__typename)';
  }
}

class GWeirdNamesData_weirdNames {
  GWeirdNamesData_weirdNames({
    this.Gclass,
    this.GtoJson,
    this.GfromJson,
    this.GcopyWith,
    this.GhashCode,
    List<String?>? Gvalues,
    this.result,
    this.GruntimeType,
    required this.G__typename,
  }) : Gvalues = Gvalues == null ? null : List.unmodifiable(Gvalues);

  factory GWeirdNamesData_weirdNames.fromJson(Map<String, dynamic> json) {
    return GWeirdNamesData_weirdNames(
      Gclass: json['class'] == null ? null : (json['class'] as String),
      GtoJson: json['toJson'] == null ? null : (json['toJson'] as String),
      GfromJson: json['fromJson'] == null ? null : (json['fromJson'] as String),
      GcopyWith: json['copyWith'] == null ? null : (json['copyWith'] as String),
      GhashCode: json['hashCode'] == null ? null : (json['hashCode'] as String),
      Gvalues: json['values'] == null
          ? null
          : List<String?>.unmodifiable(
              List<String?>.from((json['values'] as List<dynamic>))),
      result: json['result'] == null ? null : (json['result'] as String),
      GruntimeType:
          json['runtimeType'] == null ? null : (json['runtimeType'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String? Gclass;

  final String? GtoJson;

  final String? GfromJson;

  final String? GcopyWith;

  final String? GhashCode;

  final List<String?>? Gvalues;

  final String? result;

  final String? GruntimeType;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$GclassValue = this.Gclass;
    _$result['class'] = _$GclassValue == null ? null : _$GclassValue;
    final _$GtoJsonValue = this.GtoJson;
    _$result['toJson'] = _$GtoJsonValue == null ? null : _$GtoJsonValue;
    final _$GfromJsonValue = this.GfromJson;
    _$result['fromJson'] = _$GfromJsonValue == null ? null : _$GfromJsonValue;
    final _$GcopyWithValue = this.GcopyWith;
    _$result['copyWith'] = _$GcopyWithValue == null ? null : _$GcopyWithValue;
    final _$GhashCodeValue = this.GhashCode;
    _$result['hashCode'] = _$GhashCodeValue == null ? null : _$GhashCodeValue;
    final _$GvaluesValue = this.Gvalues;
    _$result['values'] = _$GvaluesValue == null
        ? null
        : _$GvaluesValue.map((_$e) => _$e == null ? null : _$e).toList();
    final _$resultValue = this.result;
    _$result['result'] = _$resultValue == null ? null : _$resultValue;
    final _$GruntimeTypeValue = this.GruntimeType;
    _$result['runtimeType'] =
        _$GruntimeTypeValue == null ? null : _$GruntimeTypeValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GWeirdNamesData_weirdNames copyWith({
    String? Gclass,
    bool GclassIsSet = false,
    String? GtoJson,
    bool GtoJsonIsSet = false,
    String? GfromJson,
    bool GfromJsonIsSet = false,
    String? GcopyWith,
    bool GcopyWithIsSet = false,
    String? GhashCode,
    bool GhashCodeIsSet = false,
    List<String?>? Gvalues,
    bool GvaluesIsSet = false,
    String? result,
    bool resultIsSet = false,
    String? GruntimeType,
    bool GruntimeTypeIsSet = false,
    String? G__typename,
  }) {
    return GWeirdNamesData_weirdNames(
      Gclass: GclassIsSet ? Gclass : this.Gclass,
      GtoJson: GtoJsonIsSet ? GtoJson : this.GtoJson,
      GfromJson: GfromJsonIsSet ? GfromJson : this.GfromJson,
      GcopyWith: GcopyWithIsSet ? GcopyWith : this.GcopyWith,
      GhashCode: GhashCodeIsSet ? GhashCode : this.GhashCode,
      Gvalues: GvaluesIsSet ? Gvalues : this.Gvalues,
      result: resultIsSet ? result : this.result,
      GruntimeType: GruntimeTypeIsSet ? GruntimeType : this.GruntimeType,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWeirdNamesData_weirdNames &&
            Gclass == other.Gclass &&
            GtoJson == other.GtoJson &&
            GfromJson == other.GfromJson &&
            GcopyWith == other.GcopyWith &&
            GhashCode == other.GhashCode &&
            _gqlUtils.listEquals(Gvalues, other.Gvalues) &&
            result == other.result &&
            GruntimeType == other.GruntimeType &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        Gclass,
        GtoJson,
        GfromJson,
        GcopyWith,
        GhashCode,
        _gqlUtils.listHash(Gvalues),
        result,
        GruntimeType,
        G__typename);
  }

  @override
  String toString() {
    return 'GWeirdNamesData_weirdNames(Gclass: $Gclass, GtoJson: $GtoJson, GfromJson: $GfromJson, GcopyWith: $GcopyWith, GhashCode: $GhashCode, Gvalues: $Gvalues, result: $result, GruntimeType: $GruntimeType, G__typename: $G__typename)';
  }
}
