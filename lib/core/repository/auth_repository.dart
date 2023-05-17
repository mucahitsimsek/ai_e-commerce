import 'package:ai_ecommerce/core/extensions/app_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../view/login/login_screen.dart';
import '../models/enums.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser.user != null) {
        Future.delayed(const Duration(seconds: 1)).whenComplete(() =>
            Navigator.pushNamedAndRemoveUntil(
                scaffoldKey.currentContext!, '/myHomeApp', (route) => false));
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        scaffoldKey.showSnackBar(
            'The email address is already in use by another account.');
        return false;
      } else if (e.code == "weak-password") {
        scaffoldKey.showSnackBar('Password should be at least 6 characters');
        return false;
      } else if (e.code == 'invalid-email') {
        scaffoldKey.showSnackBar('The email address is badly formatted.');
        return false;
      }
      if (kDebugMode) {
        'Kayıt sırasında bir hata oluştu: $e'.log();
        return false;
      }
    }
    return true;
  }

  Future<SignInState> signIn(
      {required String email, required String password}) async {
    try {
      final signInUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (!signInUser.user!.emailVerified) {
        try {
          signInUser.user!.reload();
          await signInUser.user!.sendEmailVerification();
          return SignInState.emailNotVerified;
        } catch (e) {
          'Email Verification => $e'.log();
        }
      }
      if (signInUser.user != null) {
        Future.delayed(const Duration(seconds: 1)).whenComplete(() =>
            Navigator.pushNamedAndRemoveUntil(
                scaffoldKey.currentContext!, '/myHomeApp', (route) => false));
        return SignInState.signInSuccess;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        scaffoldKey.showSnackBar("User not found");
        return SignInState.signInFail;
      } else if (e.code == 'wrong-password') {
        scaffoldKey.showSnackBar("Wrong Password");
        return SignInState.signInFail;
      } else if (e.code == 'too-many-requests') {
        getResetPassword(email);
        return SignInState.changePassword;
      }
      if (kDebugMode) {
        'Giriş sırasında bir hata oluştu: $e'.log();
        return SignInState.signInFail;
      }
    }
    return SignInState.signInSuccess;
  }

  void getResetPassword(String email) {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text("Şifreni mi Unuttun?"),
          content: const Text("Şifre sıfırlama bağlantısı gönder!"),
          actions: [
            TextButton(
              onPressed: () {
                _firebaseAuth.sendPasswordResetEmail(email: email);
              },
              child: const Text("Send"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
