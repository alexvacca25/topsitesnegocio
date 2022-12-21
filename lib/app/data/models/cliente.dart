import 'dart:convert';

class Usuario {
  int? id;
  bool? reestablecer;
  String? correo;
  String? clave;

  Usuario({
    this.id,
    this.reestablecer,
    this.correo,
    this.clave,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(correo != null){
      result.addAll({'correo': correo});
    }
    if(clave != null){
      result.addAll({'clave': clave});
    }
  
    return result;
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toInt(),
      correo: map['correo'],
      clave: map['clave'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source));
}
