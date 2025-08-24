# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- Build: `melos run build --scope=<package>` - Runs build_runner
- Analyze: `melos run analyze --scope=<package>` - Run Flutter analysis
- Test all: `cd packages/<package> && dart test`
- Test single: `cd packages/<package> && dart test path/to/test_file.dart`
- Format all: `dart format .`
- Bootstrap: `melos bootstrap` - Set up the workspace

## Code Style

- Follow the standard pedantic Dart style guide
- Use strong typing everywhere with type annotations
- Prefer final variables where possible
- Maintain immutable data classes (built_value)
- Name files using snake_case
- Use camelCase for variable and method names
- Error handling should use typed exceptions
- Wrap GraphQL operations in strongly typed classes
- Maintain schema-generated files with code generation
- Document public APIs with /// comments
- Keep code modular with single responsibility principle

## Notes

- The codebase is a monorepo using Melos for managing multiple packages
- Current work is ongoing for Ferry Generator 2.0 (see issue #622) to improve code generation
- The main branch is `master`, with feature branches for new development