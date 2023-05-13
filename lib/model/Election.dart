class Election {
  int? idEleccion;
  String? nombre;
  String? descripcion;
  String? estado;
  String? fechaInicio;
  String? fechaFin;
  Ganador? ganador;

  Election(
      {this.idEleccion,
        this.nombre,
        this.descripcion,
        this.estado,
        this.fechaInicio,
        this.fechaFin,
        this.ganador});

  Election.fromJson(Map<String, dynamic> json) {
    idEleccion = json['IdEleccion'];
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    estado = json['Estado'];
    fechaInicio = json['FechaInicio'];
    fechaFin = json['FechaFin'];
    ganador =
    json['Ganador'] != null ? new Ganador.fromJson(json['Ganador']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdEleccion'] = this.idEleccion;
    data['Nombre'] = this.nombre;
    data['Descripcion'] = this.descripcion;
    data['Estado'] = this.estado;
    data['FechaInicio'] = this.fechaInicio;
    data['FechaFin'] = this.fechaFin;
    if (this.ganador != null) {
      data['Ganador'] = this.ganador!.toJson();
    }
    return data;
  }
}

class Ganador {
  int? idPartido;
  String? nombre;
  String? descripcion;
  String? propuestas;
  String? imagen;
  String? representante;

  Ganador(
      {this.idPartido,
        this.nombre,
        this.descripcion,
        this.propuestas,
        this.imagen,
        this.representante});

  Ganador.fromJson(Map<String, dynamic> json) {
    idPartido = json['IdPartido'];
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    propuestas = json['Propuestas'];
    imagen = json['Imagen'];
    representante = json['Representante'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdPartido'] = this.idPartido;
    data['Nombre'] = this.nombre;
    data['Descripcion'] = this.descripcion;
    data['Propuestas'] = this.propuestas;
    data['Imagen'] = this.imagen;
    data['Representante'] = this.representante;
    return data;
  }
}