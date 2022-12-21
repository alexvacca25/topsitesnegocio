import 'package:file_picker/file_picker.dart';

class Files {
  static Future<FilePickerResult?> obtenerImagen()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
    return result;
  }
}