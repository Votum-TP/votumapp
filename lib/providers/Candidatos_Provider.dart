import 'dart:convert';
import 'dart:io';

import '../helpers/constant_helpers.dart';
import '../model/Partido.dart';
import 'package:http/http.dart' as http;
class PartidosProvider {

  Future<List<Partido>>  getpartidos(String electionid) async {

    final response = await http.get(
      Uri.parse("${Constants.URL}"+"/api/Elecciones/"+electionid+"/"+"Partidos/"),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDb2RpZ29Vc3VhcmlvIjoidTIwMTcxNTQxOCIsIk5vbWJyZSI6IkpvYXF1aW4iLCJBcGVsbGlkbyI6IkVnb2NoZWFnYSIsImp0aSI6IjJmNzhmMmFmLTRkYjktNDU0ZS05MDFjLTQzMTBkMjRhZWQ5ZCIsIkRhdGVHZW5lcmF0ZWQiOiIwNi8wNC8yMDIzIDE0OjMzOjM1IiwiZXhwIjoxNjgzMzgzNjE1fQ.2kAq9_53VIplWr77_q0p5v2FQ1WdeTN5-ZYjNnyfsw0',
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