class Pais{
  dynamic id;
  String? nombre;
  List<Departamento>? departamentos;
  Pais({
    this.id,
    this.nombre,
    this.departamentos
  });
}
class Departamento {
  dynamic id;
  String? nombre;
  List<Ciudad>? ciudades;
  Departamento({
    this.id,
    this.nombre,
    this.ciudades,
  });
}
class Ciudad {
  dynamic id;
  String? nombre;
  Ciudad({
    this.id,
    this.nombre,
  });
}
