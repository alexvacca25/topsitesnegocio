
import 'package:badges/badges.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../data/models/sede/imagenes_sede.dart';
import '../../../../../theme/colores.dart';
import '../../../../../widgets/boton.dart';
import '../../controller/agregar_editar_sede_controller.dart';

class ImagenesPage extends GetResponsiveView {

  AgregarEditarSedeController agregarEditarSedeController = Get.find();

  ImagenesSede imagenesSede = ImagenesSede(
    fotoLogo: null,
    fotoPrincipal: null,
    fotosAdicionales: []
  );

  final cambio = false.obs;

  @override
  Widget builder() {
    imagenesSede = agregarEditarSedeController.esEditar ? agregarEditarSedeController.sede!.imagenes ?? imagenesSede : imagenesSede;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          agregarEditarSedeController.imagenesSede = imagenesSede;
          agregarEditarSedeController.guardar();
        }, 
        label: const Text('Guardar'),
        icon: const Icon(Icons.save),
        backgroundColor: Colores.azulOscuro,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
      backgroundColor: Colores.crema,
      body: ListView(
      padding: EdgeInsets.symmetric(horizontal:screen.isDesktop ? 200 : screen.isTablet ? 100 : 0),
      children: [
        Obx(
          (){
            cambio.value;
            return Container(
              width: Get.width,
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colores.grisClaro,
                image: imagenesSede.fotoPrincipal == null ? null : DecorationImage(
                  image: imagenesSede.fotoPrincipal,
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Boton(
                        accion: ()async{
                          FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
                          if (result != null) {
                            imagenesSede.fotoPrincipal = MemoryImage(result.files.first.bytes!);
                            cambio.value = !cambio.value;
                          } 
                        },
                        child: const Icon(BootstrapIcons.camera, color: Colores.blanco,),
                      )
                    ],
                  ),
                  Badge(
                    position: BadgePosition.topEnd(top: 60, end: -10),
                    badgeContent: GestureDetector(
                      onTap: ()async{
                        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
                        if (result != null) {
                          imagenesSede.fotoLogo = MemoryImage(result.files.first.bytes!);
                          cambio.value = !cambio.value;
                        } 
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(BootstrapIcons.camera, color: Colores.blanco,size: 15,),
                      ),
                    ),
                    badgeColor: Colores.azulOscuro,
                    child: CircleAvatar(backgroundImage: imagenesSede.fotoLogo,radius: 50,),
                  )
                ],
              ),
            );
          }
        ),
        Container(
          width: Get.width,
          height: Get.height,
          color: Colores.blanco,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Imagenes adicionales'),
              BotonTexto(
                accion: ()async{
                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
                  if (result != null) {
                    imagenesSede.fotosAdicionales!.add(MemoryImage(result.files.first.bytes!));
                    cambio.value = !cambio.value;
                  } 
                },
                texto: 'Agregar imagen adicional',
              ),
              const SizedBox(height: 20,),
              Obx(
                (){
                  cambio.value;
                  if(imagenesSede.fotosAdicionales == null){
                    return Container();
                  }
                  return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: screen.isDesktop ? 5 : screen.isTablet ? 3 : 2,
                    crossAxisSpacing: 10,  
                    mainAxisSpacing: 10,
                    children: List.generate(
                        imagenesSede.fotosAdicionales!.length, 
                        (index) => Container(  
                        color: Colores.crema,  
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colores.negro.withOpacity(0.5),
                            image: DecorationImage(
                              image: imagenesSede.fotosAdicionales![index],
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Boton(
                                accion: (){
                                  imagenesSede.fotosAdicionales!.removeAt(index);
                                  cambio.value = !cambio.value;
                                },
                                child: const Icon(BootstrapIcons.trash, color: Colores.blanco,),
                              )
                            ],
                          ),
                        )  
                      )
                    ),
                  );
                }
              )
            ],
          )
        )
      ],
    ));
  }
}