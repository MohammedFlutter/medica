import 'package:flutter/material.dart';

class CustomSchemeColor {

  final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xFF345896),
    primary: const Color(0xFF345896),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFF4F7E2),
    onSecondary: const Color(0xFF000000),
    error: const Color(0xFFF53F5F),
    onError: const Color(0xFFFFFFFF),
    background: const Color(0xFFF2F2F2),
    onBackground: const Color(0xFF000000),
    surface: const Color(0xFFFFFFFF),
    onSurface: const Color(0xFF000000),
  );

  final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF345896),
    primary: const Color(0xFF345896),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFF4F7E2),
    onSecondary: const Color(0xFF000000),
    error: const Color(0xFFF53F5F),
    onError: const Color(0xFFFFFFFF),
    background: const Color(0xFF121212),
    onBackground: const Color(0xFFFFFFFF),
    surface: const Color(0xFF000000),
    onSurface: const Color(0xFFFFFFFF),
  );
}
