class Eleccion {
  String? Id;
  String? Nombre;
  String? Estado;
  String? FechaInicio;
  String? Ganador;

  Eleccion({this.Id, this.Nombre, this.Estado, this.FechaInicio, this.Ganador});

  Eleccion.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Nombre = json['Nombre'];
    Estado = json['Estado'];
    FechaInicio = json['FechaInicio'];
    Ganador = json['Ganador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Nombre'] = this.Nombre;
    data['Estado'] = this.Estado;
    data['FechaInicio'] = this.FechaInicio;
    data['Ganador'] = this.Ganador;
    return data;
  }
}