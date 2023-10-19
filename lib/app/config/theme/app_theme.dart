import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_input_theme.dart';

class AppTheme {
  ThemeData get lightTheme {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),
      inputDecorationTheme: inputTheme,
      iconTheme: const IconThemeData(color: AppColors.primary),
    );
    return theme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(theme.textTheme),
    );
  }
}
