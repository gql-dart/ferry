import 'package:analyzer/dart/ast/ast.dart';

ClassDeclaration classDecl(CompilationUnit unit, String name) {
  return unit.declarations
      .whereType<ClassDeclaration>()
      .firstWhere((decl) => decl.name.lexeme == name);
}

ConstructorDeclaration factoryConstructor(
  ClassDeclaration classDecl,
  String name,
) {
  return classDecl.members
      .whereType<ConstructorDeclaration>()
      .firstWhere((ctor) => ctor.name?.lexeme == name);
}
