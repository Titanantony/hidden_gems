// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC-hgHSa1RpUmqWZ6IKwOCTurCvyhUypNU',
    appId: '1:954286048359:web:8f55b599a3d60f784f80c2',
    messagingSenderId: '954286048359',
    projectId: 'hidden-gems-25220',
    authDomain: 'hidden-gems-25220.firebaseapp.com',
    storageBucket: 'hidden-gems-25220.appspot.com',
    measurementId: 'G-G40W2M2J4Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKN4UpJmfmeuhEpIzBtqKDBzcs1Cjg-Rs',
    appId: '1:954286048359:android:f88630607e8a8e164f80c2',
    messagingSenderId: '954286048359',
    projectId: 'hidden-gems-25220',
    storageBucket: 'hidden-gems-25220.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP9ifuDkfRU3LAwcsG7kYIz_HN5RLLxZc',
    appId: '1:954286048359:ios:e70ca1d7af3f3e4e4f80c2',
    messagingSenderId: '954286048359',
    projectId: 'hidden-gems-25220',
    storageBucket: 'hidden-gems-25220.appspot.com',
    iosBundleId: 'com.example.hiddenGems',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAP9ifuDkfRU3LAwcsG7kYIz_HN5RLLxZc',
    appId: '1:954286048359:ios:e70ca1d7af3f3e4e4f80c2',
    messagingSenderId: '954286048359',
    projectId: 'hidden-gems-25220',
    storageBucket: 'hidden-gems-25220.appspot.com',
    iosBundleId: 'com.example.hiddenGems',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-hgHSa1RpUmqWZ6IKwOCTurCvyhUypNU',
    appId: '1:954286048359:web:87d4948a39ee34114f80c2',
    messagingSenderId: '954286048359',
    projectId: 'hidden-gems-25220',
    authDomain: 'hidden-gems-25220.firebaseapp.com',
    storageBucket: 'hidden-gems-25220.appspot.com',
    measurementId: 'G-2JTYKMDEYM',
  );
}