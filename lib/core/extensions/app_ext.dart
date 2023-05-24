import 'package:flutter/cupertino.dart';
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

extension NavigationExtension on NavigatorState {
  Future<T?> pushPageRoute<T extends Object?>(WidgetBuilder builder,
      {bool maintainState = true, bool withNavBar = false}) {
    return Navigator.of(context, rootNavigator: !withNavBar).push(
      CupertinoPageRoute<T>(
        builder: builder,
        maintainState: !maintainState,
      ),
    );
  }
}

extension NavigationPushAndRemoveUntil on NavigatorState {
  Future<T?> pushRemoveUntil<T extends Object?>(Widget screen) {
    return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => screen), (route) => false);
  }
}


//AŞAĞIDAKİ KODU AKTİFLEŞTİREBİLMEK İÇİN ROUTE LİSTESİ OLUŞTURMAN GEREKİYOR GİBİ


// extension NavigationExtension2 on NavigatorState {
//   Future<T?> pushAndRemovePages<T extends Object?>({
//     bool maintainState = true,
//     bool withNavBar = false,
//     String route = "/unhandledroute",
//   }) {
//     return Navigator.of(context, rootNavigator: !withNavBar)
//         .pushNamedAndRemoveUntil(route, (route) => false);
//   }
// }
