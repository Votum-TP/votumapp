import 'dart:convert';
import 'dart:io';

import '../helpers/constant_helpers.dart';
import '../main.dart';
import '../model/Partido.dart';
import 'package:http/http.dart' as http;
class PartidosProvider {

  Future<List<Partido>>  getpartidos(String electionid) async {

    final response = await http.get(
      Uri.parse("${Constants.URL}"+"/api/Elecciones/"+electionid+"/"+"Partidos/"),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),
      },
    );

    print(Uri.parse("${Constants.URL}"+"/Elecciones/"+electionid+"/"+"Partidos/"));


    List<Partido> partidos = [];

    if(response.statusCode == 200){

      var responseJson = json.decode(response.body);
      var rest = responseJson["partidos"] as List;

      for(var aux in rest) {
        Partido eleccion = Partido.fromJson(aux);
        print(aux.toString());
        partidos.add(eleccion);
      }
    } else {
      print('NOOOOOOOOOO');

    }
    return partidos;

  }
}