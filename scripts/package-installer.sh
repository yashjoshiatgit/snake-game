#!/usr/bin/env bash
set -euo pipefail

TYPE="${1:-app-image}"  # use exe on Windows
APP_NAME="SnakeGame"
VERSION="1.0.0"

if ! command -v jpackage >/dev/null 2>&1; then
  echo "jpackage is required (use JDK 14+)." >&2
  exit 1
fi

"$(dirname "$0")/build-jar.sh"
mkdir -p build/installer

jpackage \
  --name "$APP_NAME" \
  --input build/libs \
  --main-jar "${APP_NAME}-${VERSION}.jar" \
  --main-class com.snakegame.Main \
  --type "$TYPE" \
  --dest build/installer \
  --vendor "SnakeGame" \
  --app-version "$VERSION"

echo "Installer created in build/installer"
