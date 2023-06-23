class Partido {
  int? idPartido;
  String? nombre;
  String? descripcion;
  String? propuestas;
  String? imagen;

  Partido(
      {this.idPartido,
        this.nombre,
        this.descripcion,
        this.propuestas,
        this.imagen});

  Partido.fromJson(Map<String, dynamic> json) {
    idPartido = json['IdPartido'];
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    propuestas = json['Propuestas'];
    imagen = json['Imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdPartido'] = this.idPartido;
    data['Nombre'] = this.nombre;
    data['Descripcion'] = this.descripcion;
    data['Propuestas'] = this.propuestas;
    data['Imagen'] = this.imagen;
    return data;
  }
}