// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDLJ3lQ6sHrCXOkws6ttnR3eGySSLUbNXM',
    appId: '1:55775532876:web:9df58019dc2e71bc2161e9',
    messagingSenderId: '55775532876',
    projectId: 'flutter-example-ecaa4',
    authDomain: 'flutter-example-ecaa4.firebaseapp.com',
    storageBucket: 'flutter-example-ecaa4.appspot.com',
    measurementId: 'G-HZPR0D8QBW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_9fUvL5jLiBEDbHbXkX18mTg9GAi-aoc',
    appId: '1:55775532876:android:ed0b277268da26522161e9',
    messagingSenderId: '55775532876',
    projectId: 'flutter-example-ecaa4',
    storageBucket: 'flutter-example-ecaa4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-G01d7AGVHYNBY7o0KtCxj1Ipr5IVreA',
    appId: '1:55775532876:ios:80d2d07ee19a245a2161e9',
    messagingSenderId: '55775532876',
    projectId: 'flutter-example-ecaa4',
    storageBucket: 'flutter-example-ecaa4.appspot.com',
    iosClientId: '55775532876-n0a0vomj68r3k5icptmrlagc6js1h0u1.apps.googleusercontent.com',
    iosBundleId: 'com.ru.example.flutterExample',
  );
}
