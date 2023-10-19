import 'package:flutter/material.dart';

import 'app_colors.dart';

const InputDecorationTheme inputTheme = InputDecorationTheme(
  isDense: true,
  fillColor: Colors.white,
  filled: true,
  labelStyle: TextStyle(
    color: AppColors.inputLabelColor,
  ),
  errorStyle: TextStyle(
    color: AppColors.inputErrorColor,
  ),
  hintStyle: TextStyle(
    color: AppColors.inputHintColor,
  ),
  contentPadding: EdgeInsets.only(
    left: 15.0,
    right: 10,
    top: 12,
    bottom: 12.0,
  ),
  border: OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: BorderRadius.all(Radius.circular(24)),
    borderSide: BorderSide(
      color: Colors.white10,
    ),
  ),
);
