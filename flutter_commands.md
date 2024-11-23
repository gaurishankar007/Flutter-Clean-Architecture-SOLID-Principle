# Flutter Commands

Mostly used and essential flutter commands are listed below.

1. Check flutter installation details

   - flutter doctor
   - flutter doctor --verbose `View more details like java version used by flutter`

2. Create Flutter Project

   - flutter create my_app `Create flutter project with 'my_app' name and all supported platforms`
   - flutter create --org com.example my_app `Create flutter project with organization name`
   - flutter create --platforms=android,ios,web . `Create platforms inside existing flutter project`
   - flutter create --platforms=android,ios,web my_app `Create flutter project with specified platforms`
   - dart create --template package my_package `Create Dart Package`

3. Dart pub dependencies

   - dart pub get
   - dart pub cache clean

4. Flutter pub dependencies

   - flutter pub get `Get project dependencies`
   - flutter clean `Delete build data`

4. Flutter test

   - flutter test
   - flutter test integration_test `Perform integration test`
   - flutter test --coverage `Generate test coverage`

5. Execute flutter build runner

   - dart run build_runner build --delete-conflicting-outputs
   - dart run build_runner watch --delete-conflicting-outputs

6. Run flutter project

   - flutter run
   - flutter run --flavor dev --target lib/main_dev.dart

7. Build Apk/App Bundle

   - flutter build apk --release
   - flutter build appbundle --release `Use this appbundle to upload in Play Store`
   - flutter build apk --release --dart-define API_KEY=some-api-key `Build apk with Environment Variable`
   - flutter build apk --release --flavor stg --target lib/main_stg.dart `Build apk based on the flavor`

8. Flutter Shorebird

   - shorebird init `Initialize flutter project`
   - shorebird release android/ios `Releases the android and ios app to the shorebird server`
   - shorebird preview `Install the app on the selected device`
   - shorebird patch android/ios `Pushes updates`

9. Flutter Firebase CLI (Windows)

   - `Add this path "C:\Users\{username}\AppData\Local\Pub\Cache\bin" to the system's path`
   - npm install -g firebase-tools `Install NodeJs and run this command in the terminal`
   - firebase login `Login to firebase with this command`
   - dart pub global activate flutterfire_cli `Run this command in flutter project terminal`
   - flutterfire configure `Use this command to configure your flutter project in firebase`

10. Change java sdk location used by flutter

    - flutter configure --java-dir="<java-directory"
