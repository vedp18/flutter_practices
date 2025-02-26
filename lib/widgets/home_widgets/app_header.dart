import 'package:flutter/material.dart';
import 'package:flutter_catalog/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Flutter Practice App"
            .text
            .xl4
            .fontFamily(GoogleFonts.alegreya().fontFamily as String)
            .bold
            .color(darkBluishColor)
            .make(),
      ],
    );
  }
}
