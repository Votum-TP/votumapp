class Partido {
  String? idPartido;
  String? nombre;
  String? descripciN;
  String? propuestas;
  String? imagen;
  String? codigoCandidato;

  Partido(
      {this.idPartido,
        this.nombre,
        this.descripciN,
        this.propuestas,
        this.imagen,
        this.codigoCandidato});

  Partido.fromJson(Map<String, dynamic> json) {
    idPartido = json['IdPartido'];
    nombre = json['Nombre'];
    descripciN = json['Descripción'];
    propuestas = json['Propuestas'];
    imagen = json['Imagen'];
    codigoCandidato = json['CodigoCandidato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdPartido'] = this.idPartido;
    data['Nombre'] = this.nombre;
    data['Descripción'] = this.descripciN;
    data['Propuestas'] = this.propuestas;
    data['Imagen'] = this.imagen;
    data['CodigoCandidato'] = this.codigoCandidato;
    return data;
  }
}