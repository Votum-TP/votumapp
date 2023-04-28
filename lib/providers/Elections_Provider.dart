import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:votum/helpers/constant_helpers.dart';
import 'package:http/http.dart' as http;
import 'package:votum/main.dart';

import '../model/Eleccion.dart';
import '../model/Results.dart';
class ElectionProvideer {


  Future<List<Eleccion>> getResults() async{
    final response = await http.get(
        Uri.parse("${Constants.URL}/api/Elecciones/ListarElecciones"),
      // Send authorization headers to the backend.
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),
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