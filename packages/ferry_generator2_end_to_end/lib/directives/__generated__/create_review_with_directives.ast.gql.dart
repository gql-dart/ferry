// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const CreateReviewWithDirectives = _i1.OperationDefinitionNode(
  type: _i1.OperationType.mutation,
  name: _i1.NameNode(value: 'CreateReviewWithDirectives'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'episode')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Episode'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'review')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ReviewInput'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'includeReview')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'skipCommentary')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createReview'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'episode'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'episode')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'review'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'review')),
        ),
      ],
      directives: [
        _i1.DirectiveNode(
          name: _i1.NameNode(value: 'include'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'if'),
              value:
                  _i1.VariableNode(name: _i1.NameNode(value: 'includeReview')),
            )
          ],
        )
      ],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'episode'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'stars'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'commentary'),
          alias: null,
          arguments: [],
          directives: [
            _i1.DirectiveNode(
              name: _i1.NameNode(value: 'skip'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'if'),
                  value: _i1.VariableNode(
                      name: _i1.NameNode(value: 'skipCommentary')),
                )
              ],
            )
          ],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const document = _i1.DocumentNode(definitions: [CreateReviewWithDirectives]);
