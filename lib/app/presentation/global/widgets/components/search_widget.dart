import 'package:flutter/material.dart';

import '../../../../config/extensions/resposive.dart';
import '../../../../config/helpers/debounce.dart';

/// The `SearchWidget` class is a custom widget in Dart that provides a search input field with debounce functionality.
class SearchWidget extends StatelessWidget {
  final Function(BuildContext context, String value) onChange;
  final Duration duration;
  const SearchWidget(
      {super.key,
      required this.onChange,
      this.duration = const Duration(milliseconds: 700)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: context.wp(1),
        right: context.wp(1),
      ),
      decoration: BoxDecoration(
        color: const Color(0xfff5f6f9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        cursorColor: const Color(0xffa2a2a2),
        onChanged: (text) => debounce(
          duration,
          onChange,
          [context, text],
        ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: context.wp(2)),
            child: const Icon(Icons.search),
          ),
          contentPadding: EdgeInsets.only(
            left: context.wp(2),
          ),
          isDense: true,
          hintText: "Search",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          border: const OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            borderSide: BorderSide(
              color: context.theme.primaryColor,
            ),
          ),
          fillColor: const Color(0xFFEDEBF2),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
