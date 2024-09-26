// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyColors {
  static const Color rosaClaro = Color(0xFFF4BDFF);
  static const Color cinzaEscuro = Color(0xFF676D75);
  static const Color escuro = Color(0xFF1E1E1E);
  static const Color roxoEscuro = Color(0xFF4A004E);
  static const Color preto = Color(0xFF000000);
  static BoxDecoration backgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.4,
          //   0.5,
            0.9,
          ],
          colors: [
            MyColors.roxoEscuro,
            MyColors.preto,
            // MyColors.roxoEscuro,
          ]),
      // borderRadius: BorderRadius.circular(20), // Arredondar os cantos
    );
  }
  static BoxDecoration backgroundpurple() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.4,
          //   0.5,
            0.9,
          ],
          colors: [
            MyColors.roxoEscuro,
            MyColors.roxoEscuro,
            // MyColors.roxoEscuro,
          ]),
      // borderRadius: BorderRadius.circular(20), // Arredondar os cantos
    );
  }
}

class MyFonts {
  static const String fontPrimary = 'salsa';
}
