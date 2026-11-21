import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static const FirebaseOptions _options = FirebaseOptions(
    apiKey: 'AIzaSyAzXG3L3pdezLdWP-oJ4ehXKUdeE5NFR_U',
    appId: '1:273433432184:android:4b6a72c82311e964605d8d',
    messagingSenderId: '273433432184',
    projectId: 'pertemuan6-35a75',
    storageBucket: 'pertemuan6-35a75.firebasestorage.app',
  );

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return _options;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.iOS:
        return _options;
      default:
        return _options;
    }
  }
}