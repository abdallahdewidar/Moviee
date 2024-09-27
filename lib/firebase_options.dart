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
    apiKey: 'AIzaSyAZQlGRZboWU3IygM50xavVkhlwGVoF-Eo',
    appId: '1:790814369753:web:2f183a8c7b6756fec69bc8',
    messagingSenderId: '790814369753',
    projectId: 'movissapp-a10e2',
    authDomain: 'movissapp-a10e2.firebaseapp.com',
    storageBucket: 'movissapp-a10e2.appspot.com',
    measurementId: 'G-3KWWQ3YG08',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDprutLs9WJXt0uTL4v4E829RxCnE53b9w',
    appId: '1:790814369753:android:78aec8081809587cc69bc8',
    messagingSenderId: '790814369753',
    projectId: 'movissapp-a10e2',
    storageBucket: 'movissapp-a10e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDe_MY8h4wZli93rDiaiF8OUEzwbtdNALA',
    appId: '1:790814369753:ios:edecd6fa9bb1160ec69bc8',
    messagingSenderId: '790814369753',
    projectId: 'movissapp-a10e2',
    storageBucket: 'movissapp-a10e2.appspot.com',
    iosBundleId: 'com.example.movieeapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDe_MY8h4wZli93rDiaiF8OUEzwbtdNALA',
    appId: '1:790814369753:ios:edecd6fa9bb1160ec69bc8',
    messagingSenderId: '790814369753',
    projectId: 'movissapp-a10e2',
    storageBucket: 'movissapp-a10e2.appspot.com',
    iosBundleId: 'com.example.movieeapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZQlGRZboWU3IygM50xavVkhlwGVoF-Eo',
    appId: '1:790814369753:web:979c9d3efe34917ac69bc8',
    messagingSenderId: '790814369753',
    projectId: 'movissapp-a10e2',
    authDomain: 'movissapp-a10e2.firebaseapp.com',
    storageBucket: 'movissapp-a10e2.appspot.com',
    measurementId: 'G-HXPVMJ4W77',
  );
}