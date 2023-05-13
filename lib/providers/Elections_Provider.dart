import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:votum/helpers/constant_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:votum/main.dart';
import 'package:votum/model/DetailElection.dart';
import 'package:votum/model/Election.dart';
import 'package:votum/model/Resultado.dart';

import '../model/DetailHolder.dart';
import '../model/Eleccion.dart';
import '../model/Results.dart';
class ElectionProvideer {


  Future<List<Election>> getResults() async{
    final response = await http.get(
        Uri.parse("${Constants.URL}/api/Elecciones/ListarEleccionesPorElector/"+localStorage.get('codigo').toString()),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),
      },
    );


    final responseJson = jsonDecode(response.body);
    List<Election> elecciones = [];

   if(response.statusCode == 200){
     for(var aux in responseJson) {

       Election eleccion = Election.fromJson(aux);
       print(aux.toString());
       elecciones.add(eleccion);
     }

   } else {
     print('NOOOOOOOOOO');

   }
    return elecciones;

  }

  Future<DetailHolder?> getRealResultado(int id, String codigo) async{

    final response = await http.get(
      Uri.parse("${Constants.URL}/api/Elecciones/DetalleEleccionMovil/"+id.toString()+"/"+codigo),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),
      },
    );


    final responseJson = json.decode(Utf8Decoder().convert(response.bodyBytes).toString());


    if(response.statusCode == 200){
     final aux = DetailHolder(nombre: responseJson["Nombre"], descripcion: responseJson["Descripcion"], fechaInicio: responseJson["FechaInicio"], estado: responseJson["Estado"], cantidadVotosBlancos: responseJson["CantidadVotosBlancos"], cantidadVotosValidos: responseJson["CantidadVotosValidos"], votoEmitido: responseJson["VotoEmitido"], fechaFin: responseJson["FechaFin"], partidos: null,);
      print(aux);
      return aux;

    } else {
      return null;

    }
  }

  Future<List<Partidos>> getPartidosResutlados(int id, String codigo) async{

    List<Partidos> partidos = [];

    final response = await http.get(
      Uri.parse("${Constants.URL}/api/Elecciones/DetalleEleccionMovil/"+id.toString()+"/"+codigo),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),
      },
    );


    final responseJson = jsonDecode(response.body);

    if(response.statusCode == 200){
      var rest = responseJson["Partidos"] as List;
      print(rest);
      partidos = rest.map<Partidos>((json) => Partidos.fromJson(json)).toList();

    } else {
      print(responseJson);
    }
    return partidos;

  }



}