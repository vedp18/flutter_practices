import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // primarySwatch creates theme according to given color
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        )

        // fontFamily: GoogleFonts.jetBrainsMono().fontFamily   //? this doesn't working because network not available in AVD
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        // lowering brightness to dark
        // it also override all properties according to dark brightness
        brightness: Brightness.dark,
      );
}
