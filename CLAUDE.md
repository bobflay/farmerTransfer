# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Core Flutter Commands
- `flutter run` - Run the app in debug mode with hot reload
- `flutter run --release` - Run the app in release mode
- `flutter test` - Run all widget tests
- `flutter analyze` - Run static analysis and linting
- `flutter clean` - Clean build artifacts
- `flutter pub get` - Install dependencies
- `flutter pub upgrade` - Upgrade dependencies

### Platform-Specific Development
- `flutter run -d chrome` - Run in web browser
- `flutter run -d windows` - Run on Windows desktop
- `flutter run -d macos` - Run on macOS desktop
- `flutter run -d linux` - Run on Linux desktop
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter build web` - Build for web

## Project Architecture

This is a standard Flutter project created with `flutter create`. It follows Flutter's recommended project structure:

### Key Directories
- `lib/` - Main Dart source code, entry point is `main.dart`
- `test/` - Widget and unit tests
- `android/` - Android-specific native code and configuration
- `ios/` - iOS-specific native code and configuration  
- `web/` - Web-specific assets and configuration
- `windows/`, `macos/`, `linux/` - Desktop platform configurations

### Application Structure
- Single-page counter app demonstrating basic Flutter concepts
- Uses Material Design 3 (`useMaterial3: true`)
- Implements StatefulWidget pattern for state management
- Main components: `MyApp` (root) and `MyHomePage` (stateful counter)

### Dependencies
- Uses `cupertino_icons` for iOS-style icons
- Includes `flutter_lints` for static analysis rules
- Standard Flutter SDK dependencies only

### Code Quality
- Linting configured via `analysis_options.yaml` using `package:flutter_lints/flutter.yaml`
- Widget tests located in `test/widget_test.dart`
- Follows Flutter's recommended coding patterns and Material Design guidelines