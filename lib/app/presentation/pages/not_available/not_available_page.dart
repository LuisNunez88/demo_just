import 'package:flutter/material.dart';

/// The `NotAvailablePage` class is a stateless widget that displays an error icon and a text indicating that the page is
/// not implemented.
class NotAvailablePage extends StatelessWidget {
  const NotAvailablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 100,
            ),
            Text(
              'Not Implemented',
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ),
    );
  }
}
