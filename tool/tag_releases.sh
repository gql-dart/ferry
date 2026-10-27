#!/usr/bin/env bash
# Tags HEAD with `<package>-v<version>` for every package whose pubspec
# version isn't on pub.dev yet. Pushing the tags starts
# .github/workflows/publish.yml, which publishes each tagged package.
#
# Usage: tool/tag_releases.sh [--push]
#
# Packages that aren't on pub.dev at all are skipped: pub.dev only allows
# automated publishing for existing packages, so their first version has to be
# published with `dart pub publish`.
set -euo pipefail

push=false
if [[ "${1:-}" == "--push" ]]; then
  push=true
elif [[ $# -gt 0 ]]; then
  echo "usage: $0 [--push]" >&2
  exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")/.."

if [[ -n "$(git status --porcelain --untracked-files=no)" ]]; then
  echo "The working tree has uncommitted changes." >&2
  exit 1
fi
git fetch --quiet --tags origin
if [[ -z "$(git branch --remotes --contains HEAD)" ]]; then
  echo "HEAD isn't on any branch of origin. Merge the release first." >&2
  exit 1
fi

pubspec_field() {
  awk -v field="$1:" '$1 == field { print $2; exit }' "$2" | tr -d "\"'"
}

pub_status() {
  curl --silent --output /dev/null --write-out '%{http_code}' "https://pub.dev/api/packages/$1"
}

tags=()
while IFS= read -r pubspec; do
  name="$(pubspec_field name "$pubspec")"
  version="$(pubspec_field version "$pubspec")"
  [[ -n "$version" && "$(pubspec_field publish_to "$pubspec")" != "none" ]] || continue

  if [[ "$(pub_status "$name")" != "200" ]]; then
    echo "skip $name: not on pub.dev"
    continue
  fi
  if [[ "$(pub_status "$name/versions/$version")" == "200" ]]; then
    continue
  fi

  tag="$name-v$version"
  if git rev-parse --quiet --verify "refs/tags/$tag" >/dev/null; then
    echo "skip $tag: tag exists but $name $version isn't on pub.dev; check its publish run"
    continue
  fi
  git tag --annotate "$tag" --message "$name $version"
  echo "tagged $tag"
  tags+=("$tag")
done < <(git ls-files 'pubspec.yaml' '*/pubspec.yaml')

if [[ ${#tags[@]} -eq 0 ]]; then
  echo "Nothing to tag."
  exit 0
fi

if [[ "$push" == true ]]; then
  git push origin "${tags[@]}"
else
  echo
  echo "Publish them with:"
  echo "  git push origin ${tags[*]}"
fi
