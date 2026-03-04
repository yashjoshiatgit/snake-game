#!/usr/bin/env bash
set -euo pipefail

TYPE="${1:-app-image}"  # use exe on Windows
APP_NAME="VegetarianSnake"
VERSION="1.0.0"
JAR_PATH="build/libs/${APP_NAME}-${VERSION}.jar"

"$(dirname "$0")/build-jar.sh"
mkdir -p build/installer

jpackage \
  --name "$APP_NAME" \
  --input build/libs \
  --main-jar "${APP_NAME}-${VERSION}.jar" \
  --main-class com.vegsnake.Main \
  --type "$TYPE" \
  --dest build/installer \
  --vendor "VEG_SNAKE" \
  --app-version "$VERSION"

echo "Installer created in build/installer"
