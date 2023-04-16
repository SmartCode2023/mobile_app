import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class TranSanTheme {
  static final ThemeData defaultTheme = _buildMyTheme();
  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: lightGrey,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightGrey,
        iconTheme: IconThemeData(color: lightGreen),
        elevation: 0,
      ),
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold, color: darkBlue),
        bodyMedium: GoogleFonts.poppins(fontSize: 15, color: darkBlue),
      ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
            backgroundColor: darkBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
    );
  }
}
