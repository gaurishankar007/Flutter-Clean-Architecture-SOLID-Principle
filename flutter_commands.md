# Flutter Commands

Mostly used and essential flutter commands are listed below.

1. Check flutter installation details
   - flutter doctor
   - flutter doctor --verbose `(View more details like java version used by flutter)`
2. Dart pub dependencies
   - dart pub get
   - dart pub cache clean
3. Flutter project dependencies
   - flutter pub get `(Get project dependencies)`
   - flutter clean `(Delete build data)`
4. Change java sdk location used by flutter
   - flutter configure --java-dir="<java-directory"
5. Execute flutter build runner
   - dart run build_runner build --delete-conflicting-outputs
   - dart run build_runner watch --delete-conflicting-outputs
6. Run flutter project
   - flutter run
   - flutter run --flavor dev --target lib/main_dev.dart
7. Build Apk/App Bundle
   - flutter build apk --release
   - flutter build appbundle --release `(Use this appbundle to upload in Play Store)`
   - flutter build apk --release --dart-define API_KEY=some-api-key `(Build apk with Environment Variable)`
   - flutter build apk --release --flavor stg --target lib/main_stg.dart `(Build apk based on the flavor)`
8. Flutter Shorebird
   - shorebird init `(Initialize flutter project)`
   - shorebird release android/ios `(Releases the android and ios app to the shorebird server)`
   - shorebird preview `(Install the app on the selected device)`
   - shorebird patch android/ios `(Pushes updates)`
9. Flutter Firebase CLI `(Windows)`
   - After Installing NodeJs open terminal and run this command "npm install -g firebase-tools" to install firebase tools
   - Login to firebase with this command "firebase login"
   - Run this command in flutter project terminal "dart pub global activate flutterfire_cli"
   - Add this path "C:\Users\{username}\AppData\Local\Pub\Cache\bin" to the system's path
   - Now run this command "flutterfire configure" to configure your flutter project in firebase
