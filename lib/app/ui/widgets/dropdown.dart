
import 'package:flutter/material.dart';

import '../theme/colores.dart';
import '../theme/fonts.dart';

class DropdownValue {
  dynamic value;
  String texto;
  String error;
  DropdownValue({
    required this.value,
    required this.texto,
    this.error = ''
  });  
}

class DropdownPersonalizado extends StatelessWidget {

  final List<DropdownValue> items;
  final Function(String? value) onChange;
  final String value;

  DropdownPersonalizado({super.key, required this.items, required this.onChange, required this.value});

  List<DropdownMenuItem<String>> data = [];

  @override
  Widget build(BuildContext context) {

    for (DropdownValue item in items) {
      data.add(DropdownMenuItem<String>(
        value: item.value,
        child: Text(item.texto),
      ));
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal:0),
                // margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colores.gris)
                  ),
                  // color: Colores.rojo,
                  // borderRadius: BorderRadius.circular(5)
                ),
                // decoration: BoxDecoration(
                //   border: Border.all(width: 1, color: Colores.gris),
                //   color: Colores.crema,
                //   borderRadius: BorderRadius.circular(5)
                // ),
                child: DropdownButton<String>(
                  value: value,
                  autofocus: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 0,
                  dropdownColor: Colores.crema,
                  // focusColor: Colores.blanco,
                  style: const TextStyle(color: Colores.negro, fontFamily: Fuentes.ztgrafton),
                  underline: Container( height: 0 ),
                  onChanged: onChange,
                  items: data,
                )
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Text('',
              style: TextStyle(
                fontSize: 10,
                color: Colores.rojo
              ),
            ),
          ],
        )
      ],
    );
  }
}