import 'dart:convert';
import 'dart:developer';

import 'package:votum/helpers/constant_helpers.dart';
import 'package:votum/model/Elections.dart';
import 'package:http/http.dart' as http;

import '../model/Results.dart';
class ElectionProvideer {


  List<Eleccion> getResults()  {
    //print(Uri.parse("${Constants.URL}"));
    //var response = await http.get(Uri.parse("${Constants.URL}"));
    
    var jsonData = [
      {
        "id": "1",
        "name": "Elecciones Numero 1",
        "description": "La presente elección tiene como fin elegir a los representantes de las facultades de la Universidad Nacional Federico Villareal a través de los partidos participantes.",
        "start":  "25/17/2023",
        "candidatos" : [
          {
            "id": "1",
            "name": "Juan Perez"
          },
          {
            "id": "2",
            "name": "Carlos Perez"
          },
          {
            "id": "3",
            "name": "Rivaldo Perez"
          },
          {
            "id": "4",
            "name": "Martha Perez"
          },
          {
            "id": "5",
            "name": "Ruth Perez"
          }
        ]
      },
      {
        "id": "2",
        "name": "Elecciones Numero 2",
        "description": "Description 2",
        "start":  "25/17/2023",
        "candidatos" : [
          {
            "id": "1",
            "name": "Juan Perez"
          },
          {
            "id": "2",
            "name": "Carlos Perez"
          },
          {
            "id": "3",
            "name": "Rivaldo Perez"
          },
          {
            "id": "4",
            "name": "Martha Perez"
          }
        ]
      },
      {
        "id": "3",
        "name": "Elecciones Numero 3",
        "description": "Description 3",
        "start":  "25/17/2023",
        "candidatos" : [
          {
            "id": "1",
            "name": "Juan Perez"
          },
          {
            "id": "2",
            "name": "Carlos Perez"
          },
          {
            "id": "3",
            "name": "Rivaldo Perez"
          },
          {
            "id": "4",
            "name": "Martha Perez"
          }
        ]
      },
      {
        "id": "4",
        "name": "Elecciones Numero 4",
        "description": "Description 4",
        "start":  "25/17/2023",
        "candidatos" : [
          {
            "id": "1",
            "name": "Juan Perez"
          },
          {
            "id": "2",
            "name": "Carlos Perez"
          },
          {
            "id": "3",
            "name": "Rivaldo Perez"
          },
          {
            "id": "4",
            "name": "Martha Perez"
          }
        ]
      }
    ];
    List<Eleccion> elecciones = [];

    for(var aux in jsonData) {

      Eleccion eleccion = Eleccion.fromJson(aux);
      print(aux.toString());
      elecciones.add(eleccion);
    }


    return elecciones;
  }
}