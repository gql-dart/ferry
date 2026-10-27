import 'package:analyzer/dart/ast/ast.dart';

ClassDeclaration classDecl(CompilationUnit unit, String name) {
  return unit.declarations
      .whereType<ClassDeclaration>()
      .firstWhere((decl) => decl.declaredName == name);
}

ConstructorDeclaration factoryConstructor(
  ClassDeclaration classDecl,
  String name,
) {
  return classDecl.bodyMembers
      .whereType<ConstructorDeclaration>()
      .firstWhere((ctor) => ctor.name?.lexeme == name);
}

// Analyzer 10 moved the name to `namePart` and the members to `body`, and
// analyzer 12 split `body` into block and empty bodies.
extension ClassDeclarationParts on ClassDeclaration {
  String get declaredName => namePart.typeName.lexeme;

  List<ClassMember> get bodyMembers => switch (body) {
        BlockClassBody(:final members) => members,
        _ => const [],
      };
}

extension EnumDeclarationParts on EnumDeclaration {
  String get declaredName => namePart.typeName.lexeme;

  List<ClassMember> get bodyMembers => switch (body) {
        BlockEnumBody(:final members) => members,
        _ => const [],
      };
}
