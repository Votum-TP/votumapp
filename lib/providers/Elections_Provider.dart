import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:votum/helpers/constant_helpers.dart';
import 'package:http/http.dart' as http;

import '../model/Eleccion.dart';
import '../model/Results.dart';
class ElectionProvideer {


  Future<List<Eleccion>> getResults() async{
    final response = await http.get(
        Uri.parse("${Constants.URL}/api/Elecciones"),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJDb2RpZ29Vc3VhcmlvIjoidTIwMTcxNTQxOCIsIk5vbWJyZSI6IkpvYXF1aW4iLCJBcGVsbGlkbyI6IkVnb2NoZWFnYSIsImp0aSI6IjJmNzhmMmFmLTRkYjktNDU0ZS05MDFjLTQzMTBkMjRhZWQ5ZCIsIkRhdGVHZW5lcmF0ZWQiOiIwNi8wNC8yMDIzIDE0OjMzOjM1IiwiZXhwIjoxNjgzMzgzNjE1fQ.2kAq9_53VIplWr77_q0p5v2FQ1WdeTN5-ZYjNnyfsw0',
      },
    );

    final responseJson = jsonDecode(response.body);
    /*var jsonData = [
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
    ];*/
    List<Eleccion> elecciones = [];

   if(response.statusCode == 200){
     for(var aux in responseJson) {

       Eleccion eleccion = Eleccion.fromJson(aux);
       print(aux.toString());
       elecciones.add(eleccion);
     }

   } else {
     print('NOOOOOOOOOO');

   }
    return elecciones;

  }
}