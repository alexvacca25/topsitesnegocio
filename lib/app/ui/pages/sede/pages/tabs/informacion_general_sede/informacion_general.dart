
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../theme/colores.dart';
import '../../../../../widgets/dropdown.dart';
import '../../../../../widgets/input.dart';
import '../../../../../widgets/row_column.dart';
import '../../controller/agregar_editar_sede_controller.dart';

class InformacionGeneralPage extends GetResponsiveView {

  AgregarEditarSedeController agregarEditarSedeController = Get.find();
  InformacionGeneralPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>agregarEditarSedeController.guardar(), 
        label: const Text('Guardar'),
        icon: const Icon(Icons.save),
        backgroundColor: Colores.azulOscuro,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
        body: ListView(
      padding: EdgeInsets.all(20),
      children: [
        Inputs(
          icon: BootstrapIcons.pin_map,
          titulo: 'Nombre de la sede',
          controller: agregarEditarSedeController.txtNombreSede,
        ),
        RowColumnResponsive(
          condicion: screen.isDesktop,
          children: [
            Inputs(
              icon: BootstrapIcons.telephone,
              titulo: 'Teléfono',
              controller: agregarEditarSedeController.txtTelefono,
              tipoTeclado: TextInputType.number,
            ),
            Inputs(
              icon: BootstrapIcons.telephone,
              titulo: 'Celular',
              controller: agregarEditarSedeController.txtCelular,
              tipoTeclado: TextInputType.number,
            ),
          ],
        ),
        RowColumnResponsive(
          condicion: screen.isDesktop,
          children: <Widget>[
            DropdownPersonalizado(
                items: [DropdownValue(texto: 'Pais', value: 'Pais')],
                onChange: (e) {},
                value: 'Pais'),
            DropdownPersonalizado(items: [
              DropdownValue(texto: 'Departamento', value: 'Departamento')
            ], onChange: (e) {}, value: 'Departamento'),
            DropdownPersonalizado(
                items: [DropdownValue(texto: 'Ciudad', value: 'Ciudad')],
                onChange: (e) {},
                value: 'Ciudad'),
          ],
        ),
        RowColumnResponsive(
          condicion: screen.isDesktop,
          children: <Widget>[
            Inputs(
              icon: BootstrapIcons.pin_map,
              titulo: 'Dirección',
              controller: agregarEditarSedeController.txtDireccion,
            ),
            Inputs(
              icon: BootstrapIcons.pin_map,
              titulo: 'Correo electrónico',
              controller: agregarEditarSedeController.txtCorreo,
            ),
          ],
        ),
        Inputs(
          icon: BootstrapIcons.pin_map,
          titulo: 'Descripción',
          controller: agregarEditarSedeController.txtDescripcion,
          maxLines: 3,
        ),
        SizedBox(height: 100,)
      ],
    ));
  }
}
