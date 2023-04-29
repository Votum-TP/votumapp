class DetailElection {
  String? nombre;
  String? descripcion;
  String? fechaInicio;
  String? estado;
  bool? votoEmitido;
  String? fechaFin;
  List<Partidos>? partidos;

  DetailElection(
      {this.nombre,
        this.descripcion,
        this.fechaInicio,
        this.estado,
        this.votoEmitido,
        this.fechaFin,
        this.partidos});

  DetailElection.fromJson(Map<String, dynamic> json) {
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    fechaInicio = json['FechaInicio'];
    estado = json['Estado'];
    votoEmitido = json['VotoEmitido'];
    fechaFin = json['FechaFin'];
    if (json['Partidos'] != null) {
      partidos = <Partidos>[];
      json['Partidos'].forEach((v) {
        partidos!.add(new Partidos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nombre'] = this.nombre;
    data['Descripcion'] = this.descripcion;
    data['FechaInicio'] = this.fechaInicio;
    data['Estado'] = this.estado;
    data['VotoEmitido'] = this.votoEmitido;
    data['FechaFin'] = this.fechaFin;
    if (this.partidos != null) {
      data['Partidos'] = this.partidos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Partidos {
  String? name;
  int? value;

  Partidos({this.name, this.value});

  Partidos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}