import 'dart:math';

import 'package:flutter/material.dart';

class LaPrimitiva {
  sorteig() {
    var jugada = [0, 0, 0, 0, 0, 0];
    var aleatorio = Random();
    int numero = 0;

    for (int i = 0; i < 6; i++) {
      numero = aleatorio.nextInt(49) +1;

      if (numero != jugada[0] &&
          numero != jugada[1] &&
          numero != jugada[2] &&
          numero != jugada[3] &&
          numero != jugada[4] &&
          numero != jugada[5]) {
        jugada[i] = numero;
      } else
        i--;
    }
    jugada.sort();
    return jugada;
  }

  validedPrimitiva(jugada) {
    int different = 0;
    bool rank = true;

    for (int i = 0; i < 6; i++) {
      for (int e = 0; e < 6; e++) {
        if (jugada[i] == jugada[e]) {
          different++;
        }
        if ( jugada[i] > 49 || jugada[i] <1 ) rank = false;
      }
    }
    print("---------------------- validador .............. " +
        different.toString());
    if (different == 6 && rank)
      return true;
    else
      return false;
  }
  bets(){

  }
}
