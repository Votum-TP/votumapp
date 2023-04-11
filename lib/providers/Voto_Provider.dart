import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:votum/pages/autentication_otp/otp_page.dart';
import 'package:votum/pages/face_authentication_page/authentication_page.dart';

import '../helpers/constant_helpers.dart';
import '../pages/elections_page/VotoEnviado.dart';
import '../utils/alert.dart';
class VotoProvider {


  Alert _alert = Alert();

  confirmarVoto(String CodigoUsuario, int IdEleccion, BuildContext context) async{
    Map data = {
      'CodigoUsuario' : CodigoUsuario,
      'IdEleccion' :IdEleccion
    };
    var bodyRequest = json.encode(data);

    var response = await http.post(
        Uri.parse("${Constants.URL}/"),
        headers: {"Content-Type": "application/json;  charset=UTF-8"},
        body: bodyRequest);

    if (response.statusCode == 200) {
      /*Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              AuthenticationPage(CodigoUsuario: CodigoUsuario,IdEleccion: IdEleccion,)));*/
    } else {
      _alert.createAlert(
          context, "Algo salió mal", "No se ha podido confirmar.", "aceptar");
    }
  }
  autenticarVoto(String CodigoUsuario, int IdEleccion, Image Target, BuildContext context ) async {
    Map data = {
      'Target': Target,
      'CodigoUsuario' : CodigoUsuario,
      'IdEleccion' :IdEleccion
    };
    var bodyRequest = json.encode(data);

    var response = await http.post(
        Uri.parse("${Constants.URL}/"),
        headers: {"Content-Type": "application/json;  charset=UTF-8"},
        body: bodyRequest);

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              EnviadoVoto()));
    }
    if(response.statusCode == 404) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              OtpPage()));
    }
  }

  enviarVoto(String CodigoUsuario, int IdEleccion) {

  }
}