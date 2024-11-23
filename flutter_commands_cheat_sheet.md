# Flutter Commands Cheat Sheet 📋

A collection of essential and frequently used Flutter commands to boost your productivity.

---

## 1. Check Flutter Installation Details
- ✅ `flutter doctor`: Check Flutter installation and environment setup.
- ✅ `flutter doctor --verbose`: View more details like the Java version used by Flutter.

---

## 2. Create Flutter Project
- ✅ `flutter create my_app`: Create a Flutter project with the name `my_app` and all supported platforms.
- ✅ `flutter create --org com.example my_app`: Create a Flutter project with a specified organization name.
- ✅ `flutter create --platforms=android,ios,web .`: Add platforms to an existing Flutter project.
- ✅ `flutter create --platforms=android,ios,web my_app`: Create a Flutter project with specified platforms.
- ✅ `dart create --template package my_package`: Create a Dart package.

---

## 3. Dart Pub Dependencies
- ✅ `dart pub get`: Fetch project dependencies.
- ✅ `dart pub cache clean`: Clear the Dart pub dependency cache.

---

## 4. Flutter Pub Dependencies
- ✅ `flutter pub get`: Get project dependencies.
- ✅ `flutter clean`: Delete build data.

---

## 5. Flutter Test
- ✅ `flutter test`: Run Flutter tests.
- ✅ `flutter test integration_test`: Perform integration tests.
- ✅ `flutter test --coverage`: Generate test coverage reports.

---

## 6. Execute Flutter Build Runner
- ✅ `dart run build_runner build --delete-conflicting-outputs`: Build generated files and resolve conflicts.
- ✅ `dart run build_runner watch --delete-conflicting-outputs`: Watch for changes and automatically rebuild files.

---

## 7. Run Flutter Project
- ✅ `flutter run`: Run the Flutter project.
- ✅ `flutter run --flavor dev --target lib/main_dev.dart`: Run the Flutter project with a specific flavor and target file.

---

## 8. Build APK/App Bundle
- ✅ `flutter build apk --release`: Build a release APK.
- ✅ `flutter build appbundle --release`: Build an app bundle for Play Store uploads.
- ✅ `flutter build apk --release --dart-define API_KEY=some-api-key`: Build an APK with an environment variable.
- ✅ `flutter build apk --release --flavor stg --target lib/main_stg.dart`: Build an APK for a specific flavor and target.

---

## 9. Flutter Shorebird
- ✅ `shorebird init`: Initialize a Flutter project for Shorebird.
- ✅ `shorebird release android/ios`: Release the Android or iOS app to the Shorebird server.
- ✅ `shorebird preview`: Install the app on a selected device for preview.
- ✅ `shorebird patch android/ios`: Push updates to the Shorebird server.

---

## 10. Flutter Firebase CLI (Windows)
- ✅ Add this path to the system's PATH:  
  `"C:\Users\{username}\AppData\Local\Pub\Cache\bin"`.
- ✅ `npm install -g firebase-tools`: Install Node.js and the Firebase CLI.
- ✅ `firebase login`: Log in to Firebase.
- ✅ `dart pub global activate flutterfire_cli`: Activate the FlutterFire CLI in a Flutter project.
- ✅ `flutterfire configure`: Configure Firebase for your Flutter project.

---

## 11. Change Java SDK Location Used by Flutter
- ✅ `flutter configure --java-dir="<java-directory>"`: Change the Java SDK directory used by Flutter.

---

With these commands, you're equipped to handle various aspects of Flutter development efficiently!
