#!/usr/bin/env bash
set -euo pipefail

APP_NAME="VegetarianSnake"
VERSION="1.0.0"
BUILD_DIR="build"
CLASSES_DIR="$BUILD_DIR/classes"
JAR_DIR="$BUILD_DIR/libs"

rm -rf "$BUILD_DIR"
mkdir -p "$CLASSES_DIR" "$JAR_DIR"

javac -d "$CLASSES_DIR" $(find src/main/java -name '*.java')

jar --create \
  --file "$JAR_DIR/${APP_NAME}-${VERSION}.jar" \
  --main-class com.vegsnake.Main \
  -C "$CLASSES_DIR" .

echo "Built: $JAR_DIR/${APP_NAME}-${VERSION}.jar"
