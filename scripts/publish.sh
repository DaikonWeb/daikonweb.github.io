#!/usr/bin/env sh
PROJECT_DIR=$(cd $(dirname $0)/..; pwd -P)
PROJECT_NAME=$(basename $PROJECT_DIR)
TAG=$1

cd ${PROJECT_DIR}

if git rev-parse "$TAG" >/dev/null 2>&1; then
  echo "tag $TAG already exists";
  exit 0
fi

sed -ie "s|'com.github.DaikonWeb:${PROJECT_NAME}:.*'|'com.github.DaikonWeb:${PROJECT_NAME}:${TAG}'|g" docs/quickstart.md
sed -ie "s|<version>.*</version>|<version>${TAG}</version>|g" docs/quickstart.md

git commit -am "Release ${TAG}"
git tag $TAG
git push
git push --tags