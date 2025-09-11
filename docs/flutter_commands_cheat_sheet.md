# Flutter Commands Cheat Sheet 📋

A collection of essential and frequently used Flutter commands to boost your productivity.

---

## 1. Environment Setup

- ✅ `flutter doctor`: Check Flutter installation and environment setup.
- ✅ `flutter doctor --verbose`: View more details like the Java version used by Flutter.

---

## 2. Project Management

### Create Projects
- ✅ `flutter create my_app`: Create a Flutter project with the name `my_app` and all supported platforms.
- ✅ `flutter create --org com.example my_app`: Create a Flutter project with a specified organization name.
- ✅ `flutter create --platforms=android,ios,web .`: Add platforms to an existing Flutter project.
- ✅ `flutter create --platforms=android,ios,web my_app`: Create a Flutter project with specified platforms.
- ✅ `dart create --template package my_package`: Create a Dart package.

---

## 3. Dependency Management

### Fetch and Update Dependencies
- ✅ `dart pub get`: Fetch project dependencies.
- ✅ `flutter pub get`: Get project dependencies.
- ✅ `flutter pub upgrade`: Upgrade dependencies to their latest compatible versions.
- ✅ `flutter pub upgrade --major-versions`: Upgrade dependencies to their latest major versions.

### Add or Remove Dependencies
- ✅ `flutter pub add <package_name>`: Add a new dependency.
- ✅ `flutter pub remove <package_name>`: Remove a dependency.

### Analyze Dependencies
- ✅ `flutter pub deps`: List all dependencies and their versions.
- ✅ `flutter pub outdated`: Check for outdated dependencies.
- ✅ `dart pub cache clean`: Clear the Dart pub dependency cache.

---

## 4. Code Quality and Testing

### Analyze Code
- ✅ `flutter analyze`: Analyze the project for potential issues.

### Run Tests
- ✅ `flutter test`: Run tests.
- ✅ `flutter test integration_test`: Perform integration tests.
- ✅ `flutter test --coverage`: Generate test coverage reports.

---

## 5. Code Generation (Build Runner)

- ✅ `dart run build_runner build --delete-conflicting-outputs`: Build generated files.
- ✅ `dart run build_runner watch --delete-conflicting-outputs`: Watch for changes and rebuild files.
- ✅ `dart run pigeon --input <path to the pigeon configuration file>`: Generate pigeon files.

---

## 6. Running the App

### Debug Mode
- ✅ `flutter run`: Run in debug mode.
- ✅ `flutter run --debug -d android/ios/chrome`: Run on a specific platform.

### Profile Mode
- ✅ `flutter run --profile`: Run in profile mode.

### Release Mode
- ✅ `flutter run --release`: Run in release mode.

### Flavors
- ✅ `flutter run --flavor production --target lib/main_prod.dart`: Run with "production" flavor.

### Web Options
- ✅ `flutter run -d chrome --web-browser-flag "--disable-web-security"`: Run on Chrome with web security disabled.

---

## 7. Building the App

### Build for Platforms
- ✅ `flutter build apk --release`: Build a release APK.
- ✅ `flutter build appbundle --release`: Build an app bundle for Play Store uploads.
- ✅ `flutter build ios --release`: Build a release version of the iOS app.
- ✅ `flutter build web`: Build a web app.
- ✅ `flutter build windows`: Build a Windows executable.

### Analyze Build Size
- ✅ `flutter build apk --analyze-size`: Analyze APK size.
- ✅ `flutter build appbundle --analyze-size`: Analyze app bundle size.
- ✅ `flutter build ios --analyze-size`: Analyze iOS app size.

---

## 8. Localization

- ✅ `flutter gen-l10n`: Generate localization files.

---

## 9. Shorebird Commands

- ✅ `shorebird doctor`: Check Shorebird setup.
- ✅ `shorebird login`: Log in to Shorebird.
- ✅ `shorebird release android/ios`: Release the app to Shorebird.

---

## 10. Mason CLI

- ✅ `mason init`: Initialize a Mason project.
- ✅ `mason make <brick_name>`: Generate a template from a brick.

---

## 11. Android Release Essentials

- ✅ `keytool -genkey -v -keystore upload-keystore.jks`: Generate a keystore file.