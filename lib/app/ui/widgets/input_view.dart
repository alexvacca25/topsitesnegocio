
import 'package:flutter/material.dart';
import '../theme/colores.dart';

class InputVista extends StatelessWidget{

  final String? titulo;
  final String? detalle;

  const InputVista({super.key, this.titulo, this.detalle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo ?? '', overflow: TextOverflow.ellipsis,),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colores.gris, 
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(detalle??'', overflow: TextOverflow.ellipsis, style: TextStyle(color: Colores.blanco),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
