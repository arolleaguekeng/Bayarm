import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Firebase user authentification manager
class AuthService{
  static final _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();
  static GoogleAuthProvider googleProvider = GoogleAuthProvider();

  //region Phone number and OTP Authentification
  /// Firebase authentification With Phone number
  static void authWithPhoneNumber(String phone,
      {required Function(String value, int? value1) onCodeSend,
        required Function(PhoneAuthCredential value) onAutoVerify,
        required Function(FirebaseAuthException value) onFailed,
        required Function(String value) autoRetrieval}) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 90),
      verificationCompleted: onAutoVerify,
      verificationFailed: onFailed,
      codeSent: onCodeSend,
      codeAutoRetrievalTimeout: autoRetrieval,
    );
  }
  /// Check OPT Code and SignIn
  static Future<void> validateOtp(String smsCode, String verificationId) async {
    final _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(_credential);
    return;
  }
  // endregion

  // region Google Sign in

  // Connexion with google account
  static Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) return await _auth.signInWithPopup(googleProvider);

    // start authentification Flux
    final googleUser = await _googleSignIn.signIn();

    // get authorisation details of demand
    final googleAuth = await googleUser!.authentication;

    // Create new identified
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // return user id
    return await _auth.signInWithCredential(credential);
  }
  // endregion


  /// Logout connected [User]
  static Future<void> disconnect() async {
    await _auth.signOut();
    return;
  }
  /// Get Current connected [User]
  static User? get user => _auth.currentUser;
}
