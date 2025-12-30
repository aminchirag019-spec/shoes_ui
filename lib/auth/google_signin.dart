import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class GoogleAuthHelper {
  GoogleAuthHelper._();

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
    '969666274664-jrk55bdd0gr0s23bfrp4rlb9i7uen94j.apps.googleusercontent.com',
  );

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
      await _googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint('❌ Google Sign-In cancelled');
        return null;
      }

      // 2️⃣ Get authentication tokens
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // 3️⃣ Create Firebase credential
      final OAuthCredential credential =
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // 4️⃣ Sign in to Firebase
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      debugPrint('✅ Google Sign-In Success');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('🔥 FirebaseAuthException: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('🔥 Google Sign-In Error: $e');
      rethrow;
    }
  }

  /// ✅ Sign out from Google & Firebase
  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    debugPrint('👋 User signed out');
  }

  /// ✅ Get current user
  static User? get currentUser => _auth.currentUser;

  /// ✅ Check login status
  static bool get isLoggedIn => _auth.currentUser != null;
}
