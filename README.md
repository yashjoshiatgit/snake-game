# VEG_SNAKE

A Swing-based Snake game with a clean project structure so anyone can clone/download and build it.

## Requirements
- JDK 17+ (must include `javac`, `jar`, and `jpackage`)

## Project structure
- `src/main/java/com/vegsnake` → game source code
- `scripts/build-jar.sh` / `scripts/build-jar.bat` → build runnable JAR
- `scripts/package-installer.sh` / `scripts/package-installer.bat` → build installer (`.exe` on Windows)

## Run from source
```bash
javac -d build/classes $(find src/main/java -name '*.java')
java -cp build/classes com.vegsnake.Main
```

## Build runnable JAR
Linux/macOS:
```bash
./scripts/build-jar.sh
```
Windows:
```bat
scripts\build-jar.bat
```

Output:
- `build/libs/VegetarianSnake-1.0.0.jar`

## Build installer (normal app install package)
Linux/macOS:
```bash
./scripts/package-installer.sh app-image
```

Windows (`.exe`):
```bat
scripts\package-installer.bat exe
```

Installer output:
- `build/installer/`

Other types you can pass to scripts (depends on your OS/JDK support):
- `msi`, `exe` (Windows)
- `pkg`, `dmg` (macOS)
- `deb`, `rpm` (Linux)
- `app-image` (portable app folder)
