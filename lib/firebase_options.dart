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
        return macos;
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
    apiKey: 'AIzaSyADcqCz7Px1IpVD-9o3TJx-pOg177BYiE0',
    appId: '1:810876078470:web:63b4cc40b7f76acafbc407',
    messagingSenderId: '810876078470',
    projectId: 'scholar-chat-app-94e21',
    authDomain: 'scholar-chat-app-94e21.firebaseapp.com',
    storageBucket: 'scholar-chat-app-94e21.appspot.com',
    measurementId: 'G-M1TZQ6EBY7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZWIcG9U_EqFRb-jWr84sBA2Q-gnPf5iI',
    appId: '1:810876078470:android:99d297878ba4f6ebfbc407',
    messagingSenderId: '810876078470',
    projectId: 'scholar-chat-app-94e21',
    storageBucket: 'scholar-chat-app-94e21.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoZfOWgHqjCUUYVG5sHyEosRjpIfHLXyQ',
    appId: '1:810876078470:ios:948bfc1bb1bedc9cfbc407',
    messagingSenderId: '810876078470',
    projectId: 'scholar-chat-app-94e21',
    storageBucket: 'scholar-chat-app-94e21.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoZfOWgHqjCUUYVG5sHyEosRjpIfHLXyQ',
    appId: '1:810876078470:ios:42cb62bdc249f6a5fbc407',
    messagingSenderId: '810876078470',
    projectId: 'scholar-chat-app-94e21',
    storageBucket: 'scholar-chat-app-94e21.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
