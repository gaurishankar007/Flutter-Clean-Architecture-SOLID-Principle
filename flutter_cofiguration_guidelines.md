# Flutter Configuration Guidelines

A collections of essential and frequently needed guidelines to setup flutter properly and boost your productivity.

## 1. Activate Flutter Pub Executable Commands

- `Windows`: Add this path `"C:\Users\{username}\AppData\Local\Pub\Cache\bin"` to system's Path.
- `macOs`: Add this path `export PATH="$PATH":"$HOME/.pub-cache/bin` inside .zshrc file.

## 2. Firebase CLI

- ✅ Activate flutter pub executable commands and install Node.js.
- ✅ Install the Firebase CLI:
  - Windows: `npm install -g firebase-tools`.
  - macOs: `sudo npm install -g firebase-tools`.
- ✅ Log in to Firebase: `firebase login`.
- ✅ Activate the FlutterFire CLI in a Flutter project: `dart pub global activate flutterfire_cli`.
- ✅ Configure Firebase for your Flutter project: `flutterfire configure`.

---

## 3. Change Java SDK Location Used by Flutter

By default flutter/shorebird uses the jdk version used by the android studio (C:\Program Files\Android\Android Studio\jbr) in windows.
Flutter/Shorebird neglects the JAVA_HOME version in the system variables. Therefore, either the android studio jbr should be removed or flutter
jdk location should be changed. In case of shorebird, there in commands for changing the jdk location used by it like flutter, so only options remains
to remove the android studio jbr folder so that It will use the JAVA_HOME version in the system variables.

- ✅ `flutter configure --jdk-dir="<java-directory>"`: Change the Java SDK directory used by Flutter.

---
