#!/usr/bin/env bash
# Prints `working-directory=<dir>` for the package a `<package>-v<version>`
# release tag names, after checking that its pubspec has that version.
# Used by .github/workflows/publish.yml.
set -euo pipefail

tag="${1:?usage: $0 <package>-v<version>}"

if [[ ! "$tag" =~ ^([a-z0-9_]+)-v(.+)$ ]]; then
  echo "Tag $tag doesn't have the form <package>-v<version>." >&2
  exit 1
fi
package="${BASH_REMATCH[1]}"
version="${BASH_REMATCH[2]}"

cd "$(dirname "${BASH_SOURCE[0]}")/.."

pubspec_field() {
  awk -v field="$1:" '$1 == field { print $2; exit }' "$2" | tr -d "\"'"
}

while IFS= read -r pubspec; do
  [[ "$(pubspec_field name "$pubspec")" == "$package" ]] || continue

  if [[ "$(pubspec_field publish_to "$pubspec")" == "none" ]]; then
    echo "$package has publish_to: none." >&2
    exit 1
  fi

  pubspec_version="$(pubspec_field version "$pubspec")"
  if [[ "$pubspec_version" != "$version" ]]; then
    echo "Tag $tag doesn't match $pubspec, which has version $pubspec_version." >&2
    exit 1
  fi

  echo "working-directory=$(dirname "$pubspec")"
  exit 0
done < <(git ls-files 'pubspec.yaml' '*/pubspec.yaml')

echo "No package named $package in this repository." >&2
exit 1
