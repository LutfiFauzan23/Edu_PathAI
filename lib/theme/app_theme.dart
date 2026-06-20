import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

/// Semua warna, spasi, dan style teks dipusatkan di sini supaya
/// tampilan tiap layar konsisten dan gampang diubah dari satu tempat.
class AppColors {
  static const Color primary = Color(0xFF6C2BD9); // ungu utama
  static const Color primaryDark = Color(0xFF4B1D9E);
  static const Color primaryLight = Color(0xFFF1E9FE);
  static const Color accentGreen = Color(0xFF1B5E3A);
  static const Color background = Color(0xFFF6F6F8);
  static const Color card = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF7A7A85);
  static const Color border = Color(0xFFE7E7EC);
  static const Color success = Color(0xFF2BB673);
  static const Color warning = Color(0xFFF5A623);
}

class AppTextStyles {
  static TextStyle get heading => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get subheading => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get caption => TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get button => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
  );
}