import 'package:votum/model/DetailElection.dart';

class DetailHolder {
  String? nombre;
  String? descripcion;
  String? fechaInicio;
  String? estado;
  int? cantidadVotosBlancos;
  int? cantidadVotosValidos;
  bool? votoEmitido;
  String? fechaFin;
  List<Partidos>? partidos;

  DetailHolder(
      { this.nombre,
          this.descripcion,
         this.fechaInicio,
         this.estado,
        required  this.cantidadVotosBlancos,
        required this.cantidadVotosValidos,
        required this.votoEmitido,
         this.fechaFin,
         this.partidos});

  DetailHolder.fromJson(Map<String, dynamic> json) {
    nombre = json['Nombre'];
    descripcion = json['Descripcion'];
    fechaInicio = json['FechaInicio'];
    estado = json['Estado'];
    cantidadVotosBlancos = json['CantidadVotosBlancos'];
    cantidadVotosValidos = json['CantidadVotosValidos'];
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
    data['CantidadVotosBlancos'] = this.cantidadVotosBlancos;
    data['CantidadVotosValidos'] = this.cantidadVotosValidos;
    data['VotoEmitido'] = this.votoEmitido;
    data['FechaFin'] = this.fechaFin;
    if (this.partidos != null) {
      data['Partidos'] = this.partidos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

