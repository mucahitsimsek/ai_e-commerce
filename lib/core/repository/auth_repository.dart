import 'package:ai_ecommerce/core/extensions/app_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../view/login/login_screen.dart';

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
        print('Kayıt sırasında bir hata oluştu: $e');
        return false;
      }
    }
    return true;
  }

  Future<void> signIn({required String email, required String password}) async {
    // try {} catch (e) {}
  }
}
