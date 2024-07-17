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
    apiKey: 'AIzaSyCszXBBQNRL5SaA1xPxYhmiaVIf-jiiTGo',
    appId: '1:558308081968:web:1efe0075970294f24b88f5',
    messagingSenderId: '558308081968',
    projectId: 'etl-ai',
    authDomain: 'etl-ai.firebaseapp.com',
    storageBucket: 'etl-ai.appspot.com',
    measurementId: 'G-KE4YX07WHK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBa5OJLfVqRHNDhdtuZr98uaFsKsXr5xeA',
    appId: '1:558308081968:android:fccf3be0d1813c014b88f5',
    messagingSenderId: '558308081968',
    projectId: 'etl-ai',
    storageBucket: 'etl-ai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6NVpuSL-XZMGSBMst18GadFJhl4WphMM',
    appId: '1:558308081968:ios:e546a3f9e18c869f4b88f5',
    messagingSenderId: '558308081968',
    projectId: 'etl-ai',
    storageBucket: 'etl-ai.appspot.com',
    iosBundleId: 'elastictech.biz.etlAi',
  );
}
