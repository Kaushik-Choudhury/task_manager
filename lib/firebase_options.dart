// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    } else if (Platform.isIOS || Platform.isMacOS) {
      return ios;
    } else {
      return android;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'your-web-api-key',
    appId: 'your-web-app-id',
    messagingSenderId: 'your-web-messaging-sender-id',
    projectId: 'your-web-project-id',
    authDomain: 'your-web-auth-domain',
    storageBucket: 'your-web-storage-bucket',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'your-android-api-key',
    appId: 'your-android-app-id',
    messagingSenderId: 'your-android-messaging-sender-id',
    projectId: 'your-android-project-id',
    storageBucket: 'your-android-storage-bucket',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'your-ios-api-key',
    appId: 'your-ios-app-id',
    messagingSenderId: 'your-ios-messaging-sender-id',
    projectId: 'your-ios-project-id',
    storageBucket: 'your-ios-storage-bucket',
    iosClientId: 'your-ios-client-id',
    iosBundleId: 'your-ios-bundle-id',
  );
}
