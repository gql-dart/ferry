import 'package:code_builder/code_builder.dart';
import 'package:ferry_generator/src/utils/config.dart';
import 'package:gql_code_builder/source.dart';

import './operation_req.dart';
import './fragment_req.dart';

Library buildReqLibrary(
  SourceNode docSource,
  String partUrl,
  DataToJsonMode dataToVarsMode,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partUrl))
        ..body.addAll(
          [
            ...buildOperationReqClasses(
              docSource,
              dataToVarsMode,
            ),
            ...buildFragmentReqClasses(
              docSource,
              dataToVarsMode,
            )
          ],
        ),
    );
