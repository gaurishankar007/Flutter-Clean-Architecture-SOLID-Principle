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
  - ✅ `flutter pub publish --dry-run`: Check if everything passes analysis before publishing the package to pub.dev.
  - ✅ `flutter pub publish`: Publish the package to pub.dev.

---

## 5. Test

- ✅ `flutter analyze`: Analyze the Flutter project for potential issues.
- ✅ `flutter test`: Run Flutter tests.
- ✅ `flutter test integration_test`: Perform integration tests.
- ✅ `flutter test --coverage`: Generate test coverage reports.

---

## 6. Build Runner

- ✅ `dart run build_runner build --delete-conflicting-outputs`: Build generated files and resolve conflicts.
- ✅ `dart run build_runner watch --delete-conflicting-outputs`: Watch for changes and automatically rebuild files.

---

## 7. Run Project

- 🔧 Debug Mode

  - ✅ `flutter run`: Run the project (debug mode by default).
  - ✅ `flutter run --debug`: Run in debug mode.
  - ✅ `flutter run --debug -d android/ios/chrome`: Run in debug mode on Android or iOS or Web (chrome).

- 🧪 Profile Mode

  - ✅ `flutter run --profile`: Run in profile mode.
  - ✅ `flutter run --profile -d android/ios/chrome`: Run in profile mode on Android or iOS or Web (chrome).

- 📦 Release Mode

  - ✅ `flutter run --release`: Run in release mode.
  - ✅ `flutter run --release -d android/ios/chrome`: Run in release mode on Android or iOS or Web (chrome).

- 🍦 Flavors

  - ✅ `flutter run --flavor production --target lib/main_prod.dart`: Run the project with "production" flavor.
  - ✅ `flutter run --flavor staging --target lib/main_stg.dart -d android/ios/macos`: Run "staging" flavor on Android or iOS or macOS.
  - ✅ `flutter run --flavor development --target lib/main_dev.dart -d android/ios/macos`: Run "development" flavor on Android or iOS or macOS.

- 🌐 Web Specific Options

  - ✅ `flutter run -d chrome --web-browser-flag "--disable-web-security"`: Run on Chrome with web security disabled.
  - ✅ `flutter run -d chrome --web-browser-flag "--disable-web-security" --web-browser-flag "--disable-site-isolation-trials"`: Run on Chrome with multiple browser flags.

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
- ✅ `flutter build ios --release`: Build a release version of the iOS app. Generates the .app bundle but does not create an .ipa file. Typically used for testing or archiving via Xcode.
- ✅ `flutter build ipa`: Build a distributable .ipa file for TestFlight or App Store submission. This includes the .app inside a zipped .ipa.
- ✅ `flutter build ipa --no-codesign`: Same as above, but skips code signing. Useful for CI/CD pipelines or unsigned builds.
- ✅ `flutter build web`: Deploy Flutter apps as web applications.
- ✅ `flutter build windows`: Create an executable file (.exe) for running the app on Windows.

## 10. Analyze Build Size

- ✅ `flutter build apk --analyze-size --target-platform=android-arm64`: Analyzes APK size for ARM64 architecture. You can also specify android-arm, android-arm64, android-x64, or a comma-separated list for multiple architectures.
- ✅ `flutter build appbundle --analyze-size --target-platform=android-arm64`: Analyzes Android App Bundle (AAB) size for the specified architecture(s), useful for Play Store distribution.
- ✅ `flutter build ios --analyze-size`: Analyzes the iOS app size in release mode. Must be run on macOS with Xcode installed.
- ✅ `flutter build ipa --no-codesign --analyze-size`: Builds an unsigned .ipa file and analyzes its size. Useful for CI pipelines or when skipping code signing.
- ✅ `flutter build linux --analyze-size`: Analyzes the release build size of the Linux desktop app.
- ✅ `flutter build macos --analyze-size`: Analyzes the release build size of the macOS desktop app.
- ✅ `flutter build windows --analyze-size`: Analyzes the release build size of the Windows desktop app.

---

## 11. Localization

- ✅ `flutter gen-l10n`: Generates localization files based on configuration defined in the l10n.yaml.
- ✅ `flutter gen-l10n --arb-dir=lib/l10n --template-arb-file=app_en.arb --output-localization-file=app_localizations.dart --output-dir=lib/l10n`: Generates localization files based on command lines arguments.

---

## 12. Shorebird

- ✅ `shorebird doctor`: Check Shorebird installation and environment setup.
- ✅ `shorebird doctor --verbose`: View more details like the Java version used by Shorebird.
- ✅ `shorebird login`: Login into the shorebird server.
- ✅ `shorebird logout`: Logout from the shorebird server.
- ✅ `shorebird init`: Initialize a Flutter project for Shorebird.
- ✅ `shorebird init --force`: Overwrite your existing shorebird.yaml and create a new app/app_id. Existing apps will not be affected by re-initializing shorebird if you are initializing for the first time. If your app is already initialized and contains a release in the shorebird server than it is better not to re-initialized otherwise your old app will not receive updates because it will create new app with different app_id in the shorebird sever.
- ✅ `shorebird release android/ios`: Release the Android or iOS app to the Shorebird server.
- ✅ `shorebird release android/ios <appbundle/ipa location->`: Release the Android or iOS app to the Shorebird server if appbundle or ipa is already built.
- ✅ `shorebird preview`: Install the app on a selected device for preview.
- ✅ `shorebird patch android/ios`: Push updates to the Shorebird server.

---

## 13. Mason CLI

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

## 14. Build Essential files before releasing android app to Google Play

- ✅ `keytool -genkey -v -keystore upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload`: Generate a keystore file to sign your APK.
- ✅ `certutil -encode "keystore.jks" "keystore.b64"`: Generate the Base64 content of a .jks (Java Keystore) file and a .properties file on Windows for storing in GitHub Secrets.

---

With these commands, you're equipped to handle various aspects of Flutter development efficiently!
