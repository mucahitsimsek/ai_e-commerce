import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              // Navigator.of(context).pushPageRoute(
              //   (context) => const ShoppingSummaryPage(),
              //   withNavBar: true,
              // );
            },
            child: const Text("Prees")),
      ),
    );
  }
}
