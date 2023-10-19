import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import 'components/utils.dart';

/// The `MenuLayout` class is a stateless widget that displays a bottom navigation bar and handles navigation between
/// different branches.
class MenuLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MenuLayout({super.key, required this.navigationShell});

  void _onTap(BuildContext context, int index) {
    /// The `navigationShell.goBranch()` method is used to navigate to a specific branch within the navigation shell. It takes
    /// two parameters: `index` and `initialLocation`.
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Theme(
            data: ThemeData(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: const Color(0xffcacccf),
              elevation: 0.0,
              items: getMenuItems(context, Routes.mainMenu.children!),
              type: BottomNavigationBarType.shifting,
              currentIndex: navigationShell.currentIndex,
              selectedItemColor: const Color(0xffeff4ff),
              onTap: (index) {
                _onTap(context, index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
