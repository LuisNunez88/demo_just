import 'package:flutter/material.dart';

import '../../../../../config/extensions/resposive.dart';
import '../../../../../config/router/routes.dart';

/// The function `getMenuItems` returns a list of `BottomNavigationBarItem` widgets based on a list of `Routes` objects,
/// with customized icons and labels.
///
/// Args:
///   context (BuildContext): The `BuildContext` object represents the current build context of the widget tree. It is
/// typically used to access the theme, media query, and other properties of the current context.
///   str (List<Routes>): A list of objects of type `Routes`.
List<BottomNavigationBarItem> getMenuItems(
        BuildContext context, List<Routes> str) =>
    List<BottomNavigationBarItem>.from(
      str.map(
        (x) => BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Container(
            height: 40,
            width: context.wp(12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffe9f0ff),
            ),
            child: Icon(
              Icons.home,
              color: context.theme.primaryColor,
            ),
          ),
          label: "",
          activeIcon: Container(
            height: 40,
            width: context.wp(23),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xffe9f0ff),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Icon(
                    Icons.home,
                    color: context.theme.primaryColor,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    x.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
