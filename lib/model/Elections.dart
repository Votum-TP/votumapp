import 'package:votum/model/Candidatos.dart';

class Eleccion {
  String? id;
  String? name;
  String? description;
  String? start;
  List<Candidatos>? candidatos;

  Eleccion(
      {this.id, this.name, this.description, this.start, this.candidatos});

  Eleccion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    start = json['start'];
    if (json['candidatos'] != null) {
      candidatos = <Candidatos>[];
      json['candidatos'].forEach((v) {
        candidatos!.add(new Candidatos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['start'] = this.start;
    if (this.candidatos != null) {
      data['candidatos'] = this.candidatos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}