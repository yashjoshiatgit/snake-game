#!/usr/bin/env bash
set -euo pipefail

APP_NAME="SnakeGame"
VERSION="1.0.0"
BUILD_DIR="build"
CLASSES_DIR="$BUILD_DIR/classes"
JAR_DIR="$BUILD_DIR/libs"

rm -rf "$BUILD_DIR"
mkdir -p "$CLASSES_DIR" "$JAR_DIR"

mapfile -t JAVA_SOURCES < <(find src/main/java -name '*.java')
if [ ${#JAVA_SOURCES[@]} -eq 0 ]; then
  echo "No Java sources found under src/main/java" >&2
  exit 1
fi

javac -d "$CLASSES_DIR" "${JAVA_SOURCES[@]}"

jar --create \
  --file "$JAR_DIR/${APP_NAME}-${VERSION}.jar" \
  --main-class com.snakegame.Main \
  -C "$CLASSES_DIR" .

echo "Built: $JAR_DIR/${APP_NAME}-${VERSION}.jar"
