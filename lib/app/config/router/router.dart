import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../inject_repositories.dart';
import '../../presentation/global/widgets/layout/menu_layout.dart';
import '../../presentation/pages/pages.dart';
import 'routes.dart';

/// The code is creating an instance of the `GoRouter` class called `appRouter`.
final appRouter = GoRouter(
  initialLocation: Routes.root.path,
  routes: [
    GoRoute(
      name: Routes.root.name,
      path: Routes.root.path,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: Routes.login.name,
      path: Routes.login.path,
      builder: (context, state) => const LoginPage(),
      redirect: (context, state) async {
        final auth = Repositories.authentication;
        final isSignedIn = await auth.isSignedIn;
        final isCountrySelected = await auth.isCountrySelected;
        if (isSignedIn) {
          if (isCountrySelected) {
            return Routes.competitions.path;
          } else {
            return Routes.countries.path;
          }
        } else {
          return null;
        }
      },
    ),
    GoRoute(
      name: Routes.countries.name,
      path: Routes.countries.path,
      builder: (context, state) => const CountriesPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return MenuLayout(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: [
          GoRoute(
            name: Routes.competitions.name,
            path: Routes.competitions.path,
            builder: (context, state) => const CompetitionsPage(),
          ),
        ]),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.notAvailable.name,
              path: Routes.notAvailable.path,
              builder: (context, state) => const NotAvailablePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.notAvailable1.name,
              path: Routes.notAvailable1.path,
              builder: (context, state) => const NotAvailablePage(),
            ),
          ],
        ),
      ],
    ),
  ],
  redirect: (context, state) async {
    if (state.fullPath == Routes.login.path ||
        state.fullPath == Routes.root.path) {
      return null;
    } else {
      final auth = Repositories.authentication;
      final isSignedIn = await auth.isSignedIn;

      if (isSignedIn) {
        return null;
      } else {
        return Routes.login.path;
      }
    }
  },
);
