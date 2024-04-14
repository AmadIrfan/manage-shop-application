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
    apiKey: 'AIzaSyA8T4aLIY_qVDR_dvL6nr6cl9vDmSSBfYs',
    appId: '1:82385259640:web:24269fbc181c341ed6b18d',
    messagingSenderId: '82385259640',
    projectId: 'shop-app-68870',
    authDomain: 'shop-app-68870.firebaseapp.com',
    storageBucket: 'shop-app-68870.appspot.com',
    measurementId: 'G-1ZP8YGSD9M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGPB43G_tA3IvNWXBKo6Y_54S8KyW_Rqg',
    appId: '1:82385259640:android:293b40d921a61ab0d6b18d',
    messagingSenderId: '82385259640',
    projectId: 'shop-app-68870',
    storageBucket: 'shop-app-68870.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7xrnfqisHjvrIdPPzK14y80yAMd40GjE',
    appId: '1:82385259640:ios:cb3633b85d318482d6b18d',
    messagingSenderId: '82385259640',
    projectId: 'shop-app-68870',
    storageBucket: 'shop-app-68870.appspot.com',
    iosBundleId: 'com.example.shopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7xrnfqisHjvrIdPPzK14y80yAMd40GjE',
    appId: '1:82385259640:ios:cb3633b85d318482d6b18d',
    messagingSenderId: '82385259640',
    projectId: 'shop-app-68870',
    storageBucket: 'shop-app-68870.appspot.com',
    iosBundleId: 'com.example.shopApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8T4aLIY_qVDR_dvL6nr6cl9vDmSSBfYs',
    appId: '1:82385259640:web:fdd38e75b8000105d6b18d',
    messagingSenderId: '82385259640',
    projectId: 'shop-app-68870',
    authDomain: 'shop-app-68870.firebaseapp.com',
    storageBucket: 'shop-app-68870.appspot.com',
    measurementId: 'G-Y4JR40Z7HT',
  );
}
