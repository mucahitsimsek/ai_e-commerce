import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../models/enums.dart';

extension SnackbarExtension on GlobalKey<ScaffoldState> {
  void showSnackBar(String message) {
    final currentContext = this.currentContext;
    if (currentContext != null) {
      ScaffoldMessenger.of(currentContext).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }
}

extension LogExtension on String {
  void log() {
    developer.log(this);
  }
}

extension SignInStateExtension on SignInState {
  String get message {
    switch (this) {
      case SignInState.emailNotVerified:
        return "Please verify your email.";
      case SignInState.signInFail:
        return "Sign in failed.";
      case SignInState.signInSuccess:
        return "Sign in successful.";
      default:
        return "";
    }
  }
}
