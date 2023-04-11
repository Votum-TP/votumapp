import '../model/Partido.dart';

class PartidosProvider {

  List<Partido> getpartidos() {

    var jsonData = [
      {
        "IdPartido": "1",
        "Nombre": "partido Progreso Perú",
        "Descripción" : "Progresando ando",
        "Propuestas" : "Tenemos como propuestas ganar",
        "Imagen" : "asdasd",
        "CodigoCandidato": "1"
      },
      {
        "IdPartido": "2",
        "Nombre": "Progreso Perú",
        "Descripción" : "Partido Organizate",
        "Propuestas" : "Tenemos como propuestas ganar",
        "Imagen" : "asdasd",
        "CodigoCandidato": "2"
      },
      {
        "IdPartido": "3",
        "Nombre": "Partido Convergencia",
        "Descripción" : "Progresando ando",
        "Propuestas" : "Tenemos como propuestas ganar",
        "Imagen" : "asdasd",
        "CodigoCandidato": "3"
      }
    ];
    List<Partido> partidos = [];

    for(var aux in jsonData) {

    Partido partido = Partido.fromJson(aux);
    print(aux.toString());
    partidos.add(partido);
    }


    return partidos;

   }
}