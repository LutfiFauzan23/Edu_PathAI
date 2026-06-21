import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Service untuk semua proses autentikasi (Email/Password, Google, Facebook).
///
/// PENTING soal Google Sign-In v7+:
/// Sejak google_sign_in versi 7, API berubah total dari versi lama:
///   - `GoogleSignIn()` (constructor) -> `GoogleSignIn.instance` (singleton)
///   - `.signIn()` -> `.authenticate()`
///   - `googleUser.authentication` (dulu Future) -> sekarang getter biasa (sync)
/// Class ini sudah pakai API yang baru. `initialize()` WAJIB dipanggil
/// sekali sebelum `authenticate()` dipanggil pertama kali — sudah
/// ditangani otomatis lewat `_ensureGoogleInitialized()`.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _googleInitialized = false;

  /// Pastikan GoogleSignIn.instance sudah di-initialize sebelum dipakai.
  /// Aman dipanggil berkali-kali (idempotent).
  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    await _googleSignIn.initialize(
      // TODO (opsional): isi serverClientId jika butuh akses token untuk
      // backend custom di luar Firebase. Untuk login Firebase biasa,
      // tidak wajib diisi.
      // serverClientId: 'GANTI_DENGAN_WEB_CLIENT_ID.apps.googleusercontent.com',
    );
    _googleInitialized = true;
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  /// Login / registrasi dengan email & password.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> registerWithEmail({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Login dengan akun Google. Mengembalikan null jika user
  /// membatalkan proses sign-in.
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _ensureGoogleInitialized();

      final GoogleSignInAccount googleUser =
          await _googleSignIn.authenticate();

      // Di v7, `.authentication` sudah synchronous (bukan Future lagi)
      // dan hanya berisi idToken (access token diambil terpisah lewat
      // authorizationClient kalau dibutuhkan scope tambahan).
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      // Termasuk kasus user membatalkan dialog sign-in.
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    }
  }

  /// Login dengan akun Facebook. Mengembalikan null jika user
  /// membatalkan proses sign-in.
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: const ['email', 'public_profile'],
    );

    if (result.status != LoginStatus.success || result.accessToken == null) {
      return null;
    }

    final credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );

    return await _auth.signInWithCredential(credential);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
      FacebookAuth.instance.logOut(),
    ]);
  }
}
