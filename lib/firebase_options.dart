// // File generated manually berdasarkan android/app/google-services.json
// //
// // PENTING: Konfigurasi di bawah ini SUDAH VALID untuk Android.
// // Untuk Web dan iOS, nilai masih placeholder dan harus diganti
// // dengan cara generate ulang via FlutterFire CLI. Lihat panduan
// // "SETUP_LOGIN.md" yang disertakan untuk langkah lengkapnya.
// //
// // Cara cepat generate ulang otomatis (lebih disarankan daripada edit manual):
// //   1. dart pub global activate flutterfire_cli
// //   2. flutterfire configure --project=edupath-ai-a35fa
// //   File ini akan ditimpa otomatis dengan nilai yang benar untuk semua platform.

// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

// /// Default [FirebaseOptions] untuk digunakan dengan Firebase Apps Anda.
// ///
// /// Contoh penggunaan:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions belum dikonfigurasi untuk windows - '
//           'jalankan `flutterfire configure` untuk menambahkannya.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions belum dikonfigurasi untuk linux - '
//           'jalankan `flutterfire configure` untuk menambahkannya.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions tidak didukung untuk platform ini.',
//         );
//     }
//   }

//   /// Diisi dari android/app/google-services.json (sudah valid & siap pakai).
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyCoVD_49vfS-xDnG7T_FgnMmdkNIK6I3xY',
//     appId: '1:808588462143:android:bf265e0a8a6217f05d908a',
//     messagingSenderId: '808588462143',
//     projectId: 'edupath-ai-a35fa',
//     storageBucket: 'edupath-ai-a35fa.firebasestorage.app',
//   );

//   /// TODO: Belum ada app Web terdaftar di Firebase Console untuk project ini.
//   /// Tambahkan Web App di Firebase Console > Project settings > Add app > Web,
//   /// lalu ganti nilai di bawah ini (atau jalankan `flutterfire configure`).
//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'GANTI_DENGAN_WEB_API_KEY',
//     appId: 'GANTI_DENGAN_WEB_APP_ID',
//     messagingSenderId: '808588462143',
//     projectId: 'edupath-ai-a35fa',
//     authDomain: 'edupath-ai-a35fa.firebaseapp.com',
//     storageBucket: 'edupath-ai-a35fa.firebasestorage.app',
//   );

//   /// TODO: Belum ada app iOS terdaftar di Firebase Console untuk project ini.
//   /// Tambahkan iOS App di Firebase Console, download GoogleService-Info.plist,
//   /// lalu ganti nilai di bawah ini (atau jalankan `flutterfire configure`).
//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'GANTI_DENGAN_IOS_API_KEY',
//     appId: 'GANTI_DENGAN_IOS_APP_ID',
//     messagingSenderId: '808588462143',
//     projectId: 'edupath-ai-a35fa',
//     storageBucket: 'edupath-ai-a35fa.firebasestorage.app',
//     iosBundleId: 'com.example.eduPath',
//   );

//   /// TODO: sama seperti iOS, belum ada app macOS terdaftar.
//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'GANTI_DENGAN_MACOS_API_KEY',
//     appId: 'GANTI_DENGAN_MACOS_APP_ID',
//     messagingSenderId: '808588462143',
//     projectId: 'edupath-ai-a35fa',
//     storageBucket: 'edupath-ai-a35fa.firebasestorage.app',
//     iosBundleId: 'com.example.eduPath',
//   );
// }
