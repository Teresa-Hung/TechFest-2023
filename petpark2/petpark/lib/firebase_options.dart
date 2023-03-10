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
    apiKey: 'AIzaSyCjgAgXt6RgjPe1_YMRkAtMQgY-j1DLg7U',
    appId: '1:556849184580:web:539257678a0d286a636111',
    messagingSenderId: '556849184580',
    projectId: 'petpark2',
    authDomain: 'petpark2.firebaseapp.com',
    storageBucket: 'petpark2.appspot.com',
    measurementId: 'G-PRF5X854RR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXrg27flxX71ekcnbtX5c9PqD5zkUcZnc',
    appId: '1:556849184580:android:512eb68a81b3a57a636111',
    messagingSenderId: '556849184580',
    projectId: 'petpark2',
    storageBucket: 'petpark2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRVq3O1VGXbKgtm_QFDLtmtTKOp-A8nvs',
    appId: '1:556849184580:ios:38d51c7f79bf84e3636111',
    messagingSenderId: '556849184580',
    projectId: 'petpark2',
    storageBucket: 'petpark2.appspot.com',
    iosClientId: '556849184580-fctv0ap15qa486mu3i6f1sdimc584kmb.apps.googleusercontent.com',
    iosBundleId: 'com.example.petpark',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRVq3O1VGXbKgtm_QFDLtmtTKOp-A8nvs',
    appId: '1:556849184580:ios:38d51c7f79bf84e3636111',
    messagingSenderId: '556849184580',
    projectId: 'petpark2',
    storageBucket: 'petpark2.appspot.com',
    iosClientId: '556849184580-fctv0ap15qa486mu3i6f1sdimc584kmb.apps.googleusercontent.com',
    iosBundleId: 'com.example.petpark',
  );
}
