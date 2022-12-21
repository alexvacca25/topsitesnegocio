
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import '../theme/colores.dart';

class ErrorPantalla extends StatelessWidget {
  const ErrorPantalla({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colores.negro,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              BootstrapIcons.exclamation_triangle,
              color: Colores.blanco,
              size: 100,
            ),
            const SizedBox(height: 20,),
            Text(
              'Tamaño de dispositivo no valido',
              style: TextStyle(
                color: Colores.blanco
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

