# Contributing to Ferry

## Create a new issue

The easiest way to get involved is to create a [new issue](https://github.com/gql-dart/ferry/issues/new) when you spot a bug, if the documentation is incomplete or out of date, or if you identify an implementation problem.

## General coding guidlines

If you'd like to add a feature or fix a bug, we're more than happy to accept pull requests! We only ask a few things:

- Use [conventional commits](https://www.conventionalcommits.org/). `melos version` builds the changelogs and version bumps from them.
- Ensure your code contains no analyzer errors.
- Format your code with `dartfmt`.
- Write tests for all new code paths, consider using the [Stream Matchers](https://pub.dartlang.org/packages/test#stream-matchers) available from the test package.
- Write helpful documentation
- If you would like to make a bigger / fundamental change to the codebase, please file a lightweight example PR / issue first.

## Development setup

The packages and examples form a [pub workspace](https://dart.dev/tools/pub/workspaces): they share one dependency resolution and one `pubspec.lock` in the repository root, and their dependencies on each other resolve to the local packages. [Melos](https://melos.invertase.dev) runs commands across them; its configuration is in the root `pubspec.yaml`.

```bash
dart pub global activate melos
melos bootstrap   # runs flutter pub get for the whole workspace
melos run analyze
melos run test
```

CI runs on the Flutter version set in `.github/workflows/validate.yml`. The Flutter SDK pins some dependencies, so update `pubspec.lock` with that Flutter version.

## Releasing

`.github/workflows/publish.yml` publishes a package when its release tag, `<package>-v<version>`, is pushed. pub.dev authenticates the run with GitHub's OIDC token ([automated publishing](https://dart.dev/tools/pub/automated-publishing)), so the repository stores no pub.dev credentials, and only maintainers can create release tags.

To release from `master`:

```bash
git switch master && git pull
dart run melos version --yes --prerelease   # or a stable bump; creates the release commit and tags
git push --follow-tags origin master
```

To release from a branch that only accepts pull requests, such as a backport branch: bump the versions and changelogs in a pull request (`melos version --no-git-tag-version`), merge it, check out the merged commit and run:

```bash
tool/tag_releases.sh --push
```

The script tags every package whose version isn't on pub.dev yet. Follow the "Publish to pub.dev" runs in GitHub Actions. A new package's first version has to be published with `dart pub publish`.
