import 'package:flutter/material.dart';

import '../theme/colores.dart';

class DatePicker {
  Future<DateTime?> porDefecto(context)async{
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colores.rosa, // <-- SEE HERE
              onPrimary: Colores.blanco, // <-- SEE HERE
              onSurface: Colores.gris, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colores.rosa, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    return fecha;
  }
}