# Flutter Commands Cheat Sheet 📋

A collection of essential and frequently used Flutter commands to boost your productivity.

---

## 1. Flutter Installation Details

- ✅ `flutter doctor`: Check Flutter installation and environment setup.
- ✅ `flutter doctor --verbose`: View more details like the Java version used by Flutter.

---

## 2. Project

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

## 4. Pub Dependencies

- ✅ `flutter clean`: Delete build data.
- ✅ `flutter pub get`: Get project dependencies.
- ✅ `flutter pub upgrade`: Upgrades all dependencies to their latest compatible versions.
- ✅ `flutter pub upgrade --major-versions`: Upgrades all dependencies to their latest major versions (including breaking changes, if any).
- ✅ `flutter pub add <package_name>`: Adds a new dependency to the pubspec.yaml file.
- ✅ `flutter pub remove <package_name>`: Removes a dependency from the pubspec.yaml file.
- ✅ `flutter pub deps`: Lists all dependencies and their versions.
- ✅ `flutter pub outdated`: Checks for outdated dependencies and lists them.

---

## 5. Test

- ✅ `flutter test`: Run Flutter tests.
- ✅ `flutter test integration_test`: Perform integration tests.
- ✅ `flutter test --coverage`: Generate test coverage reports.

---

## 6. Build Runner

- ✅ `dart run build_runner build --delete-conflicting-outputs`: Build generated files and resolve conflicts.
- ✅ `dart run build_runner watch --delete-conflicting-outputs`: Watch for changes and automatically rebuild files.

---

## 7. Run Project

- ✅ `flutter run`: Run the Flutter project.
- ✅ `flutter run --flavor dev --target lib/main_dev.dart`: Run the Flutter project with a specific flavor and target file.

---

## 8. Install Project

- ✅ `flutter Install`: Builds the APK and then installs it inside the selected device. If the apk is already build then installs whichever APK (release, debug) was last built.
- ✅ `flutter install --use-application-binary=<APK-PATH>`: If the APK is already built and then replace <APK-PATH> with the path to your APK file to install it.

---

## 9. Build

- ✅ `flutter build apk --release`: Build a release APK.
- ✅ `flutter build appbundle --release`: Build an app bundle for Play Store uploads.
- ✅ `flutter build apk --release --dart-define API_KEY=some-api-key`: Build an APK with an environment variable.
- ✅ `flutter build apk --release --flavor stg --target lib/main_stg.dart`: Build an APK for a specific flavor and target.
- ✅ `flutter build web`: Deploy Flutter apps as web applications.
- ✅ `flutter build windows`: Create an executable file (.exe) for running the app on Windows.

---

## 10. Shorebird

- ✅ `shorebird init`: Initialize a Flutter project for Shorebird.
- ✅ `shorebird release android/ios`: Release the Android or iOS app to the Shorebird server.
- ✅ `shorebird preview`: Install the app on a selected device for preview.
- ✅ `shorebird patch android/ios`: Push updates to the Shorebird server.

---

## 11. Mason CLI

- ✅ `dart pub global activate mason_cli`: Activate mason cli globally.
- ✅ `mason init`: Initialize a Mason project.
- ✅ `mason activate <brick_name>`: Activate a specific brick globally.
- ✅ `mason deactivate <brick_name>`: Deactivate a specific brick globally.
- ✅ `mason new <brick_name>`: Create a new brick in the current Mason project.
- ✅ `mason get`: Fetch all the bricks specified in the mason.yaml file.
- ✅ `mason make <brick_name>`: Generate a template from a specific brick.
- ✅ `mason make <brick_name> --config-path <path_to_config.json>`: Generate a template from a brick using a custom config.json file.
- ✅ `mason remove <brick_name>`: Remove a specific brick from the current Mason configuration.
- ✅ `mason upgrade`: Update Mason CLI to the latest version and fetch the latest versions of all bricks.
- ✅ `mason cache clean`: Clear the Mason cache to remove old configurations and data.

---

## 12. Firebase CLI (Windows)

- ✅ Add this path to the system's PATH:  
  `"C:\Users\{username}\AppData\Local\Pub\Cache\bin"`.
- ✅ `npm install -g firebase-tools`: Install Node.js and the Firebase CLI.
- ✅ `firebase login`: Log in to Firebase.
- ✅ `dart pub global activate flutterfire_cli`: Activate the FlutterFire CLI in a Flutter project.
- ✅ `flutterfire configure`: Configure Firebase for your Flutter project.

---

## 13. Change Java SDK Location Used by Flutter

- ✅ `flutter configure --java-dir="<java-directory>"`: Change the Java SDK directory used by Flutter.

---

With these commands, you're equipped to handle various aspects of Flutter development efficiently!
