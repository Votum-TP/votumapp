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