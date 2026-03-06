// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_generator2_end_to_end/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

/// The query type for the schema.
class GSettingsData {
  GSettingsData({
    Map<String, dynamic>? settings,
    required this.G__typename,
  }) : settings = settings == null
            ? null
            : Map<String, dynamic>.unmodifiable(settings);

  factory GSettingsData.fromJson(Map<String, dynamic> json) {
    return GSettingsData(
      settings: json['settings'] == null
          ? null
          : Map<String, dynamic>.unmodifiable(
              (json['settings'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final Map<String, dynamic>? settings;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$settingsValue = this.settings;
    _$result['settings'] = _$settingsValue == null ? null : _$settingsValue;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GSettingsData copyWith({
    Map<String, dynamic>? settings,
    bool settingsIsSet = false,
    String? G__typename,
  }) {
    return GSettingsData(
      settings: settingsIsSet ? settings : this.settings,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSettingsData &&
            _gqlUtils.deepEquals(settings, other.settings) &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(settings), G__typename);
  }

  @override
  String toString() {
    return 'GSettingsData(settings: $settings, G__typename: $G__typename)';
  }
}
