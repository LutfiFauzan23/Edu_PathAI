import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'api_service.dart'; // Import ApiService yang baru dibuat
import 'firestore_service.dart'; // Import FirestoreService jika ingin tetap simpan ganda

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirestoreService _firestoreService = FirestoreService();

  // ... (biarkan _ensureGoogleInitialized dan getter lainnya tetap sama) ...

  /// Registrasi dengan email & password.
  Future<UserCredential> registerWithEmail({
    required String name, // Tambahkan parameter name
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = credential.user;
    if (user != null) {
      // Update display name di Firebase Auth
      await user.updateDisplayName(name);
      
      // Sinkronisasi ke Firestore (opsional jika masih dipakai)
      await _firestoreService.createUser(user);

      // Sinkronisasi ke MySQL
      await ApiService.syncUserToMysql(
        uid: user.uid,
        name: name,
        email: user.email!,
        provider: 'email',
      );
    }
    return credential;
  }

  /// Login dengan akun Google.
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _ensureGoogleInitialized();
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        // Sinkronisasi ke Firestore
        await _firestoreService.createUser(user);

        // Sinkronisasi ke MySQL
        await ApiService.syncUserToMysql(
          uid: user.uid,
          name: user.displayName ?? 'Google User',
          email: user.email ?? '',
          photoUrl: user.photoURL,
          provider: 'google',
        );
      }
      return userCredential;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    }
  }

  // Lakukan hal yang sama untuk signInWithFacebook() dengan mengubah parameternya menjadi provider: 'facebook'.
}