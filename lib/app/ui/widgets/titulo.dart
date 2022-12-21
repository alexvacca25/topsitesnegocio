import 'package:flutter/material.dart';

import '../../constantes.dart';
import '../theme/colores.dart';
import '../theme/fonts.dart';

class TituloWidget extends StatelessWidget {
  const TituloWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            fontSize: 20,
            fontFamily: Fuentes.ztgraftonThin,
            color: Colores.negro),
        children: <TextSpan>[
          TextSpan(
            text: titulo.substring(0, 3),
            style: const TextStyle(
                fontFamily: Fuentes.ztgraftonBold,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colores.rosa),
          ),
          TextSpan(
            text: titulo.substring(3, titulo.length),
            style: const TextStyle(
                fontFamily: Fuentes.ztgraftonBold,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colores.azulOscuro),
          ),
        ],
      ),
    );
  }
}