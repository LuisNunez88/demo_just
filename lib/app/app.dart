import 'package:flutter/material.dart';

import 'config/router/router.dart';
import 'config/theme/app_theme.dart';

/// The `App` class is a stateless widget that configures the MaterialApp with a custom theme and router.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      routerConfig: appRouter,
    );
  }
}
