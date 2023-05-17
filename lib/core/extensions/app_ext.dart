import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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
