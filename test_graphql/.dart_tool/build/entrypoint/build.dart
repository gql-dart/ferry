// ignore_for_file: directives_ordering

import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:ferry_generator/src/req_builder.dart' as _i2;
import 'package:gql_build/gql_build.dart' as _i3;
import 'package:built_value_generator/builder.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'package:build_config/build_config.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
      'ferry_generator:req_builder', [_i2.reqBuilder], _i1.toNoneByDefault(),
      hideOutput: false,
      appliesBuilders: [
        'gql_build:serializer_builder',
        'built_value_generator:built_value'
      ]),
  _i1.apply('gql_build:data_builder', [_i3.dataBuilder], _i1.toNoneByDefault(),
      hideOutput: false,
      appliesBuilders: [
        'gql_build:serializer_builder',
        'built_value_generator:built_value'
      ]),
  _i1.apply('gql_build:req_builder', [_i3.reqBuilder], _i1.toNoneByDefault(),
      hideOutput: false,
      appliesBuilders: [
        'gql_build:serializer_builder',
        'built_value_generator:built_value'
      ]),
  _i1.apply(
      'gql_build:schema_builder', [_i3.schemaBuilder], _i1.toNoneByDefault(),
      hideOutput: false,
      appliesBuilders: [
        'gql_build:serializer_builder',
        'built_value_generator:built_value'
      ]),
  _i1.apply('gql_build:var_builder', [_i3.varBuilder], _i1.toNoneByDefault(),
      hideOutput: false,
      appliesBuilders: [
        'gql_build:serializer_builder',
        'built_value_generator:built_value'
      ]),
  _i1.apply('gql_build:serializer_builder', [_i3.serializerBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false,
      appliesBuilders: ['built_value_generator:built_value']),
  _i1.apply('built_value_generator:built_value', [_i4.builtValue],
      _i1.toDependentsOf('built_value_generator'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('gql_build:ast_builder', [_i3.astBuilder], _i1.toNoneByDefault(),
      hideOutput: false),
  _i1.apply('source_gen:combining_builder', [_i5.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: ['source_gen:part_cleanup']),
  _i1.applyPostProcess('source_gen:part_cleanup', _i5.partCleanup,
      defaultGenerateFor: const _i6.InputSet())
];
void main(List<String> args, [_i7.SendPort sendPort]) async {
  var result = await _i8.run(args, _builders);
  sendPort?.send(result);
  _i9.exitCode = result;
}
