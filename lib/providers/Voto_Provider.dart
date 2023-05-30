import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:votum/pages/autentication_otp/otp_page.dart';
import 'package:votum/pages/elections_page/Enviar_voto.dart';
import 'package:votum/pages/face_authentication_page/authentication_page.dart';

import '../helpers/constant_helpers.dart';
import '../main.dart';
import '../pages/autentication_otp/otp_view_page.dart';
import '../pages/elections_page/VotoEnviado.dart';
import '../pages/face_authentication_page/face_noverify.dart';
import '../pages/face_authentication_page/face_verify.dart';
import '../utils/alert.dart';
class VotoProvider {


  Alert _alert = Alert();

  confirmarVoto(String CodigoUsuario, int IdEleccion, int IdPartido, BuildContext context) async{
    Map data = {
      'CodigoUsuario' : CodigoUsuario,
      'IdEleccion' :IdEleccion,
      'IdPartido' :IdPartido
    };
    var bodyRequest = json.encode(data);

    var response = await http.post(
        Uri.parse("${Constants.URL}/api/Votos/ConfirmarVoto"),
        headers: {"Content-Type": "application/json;  charset=UTF-8",
          HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),},
        body: bodyRequest);
    var jsonData =
    json.decode(Utf8Decoder().convert(response.bodyBytes).toString());

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              AuthenticationPage(IdEleccion: IdEleccion)));
    } else {
      _alert.createAlert(
          context, "Algo salió mal", "No se ha podido confirmar.", "aceptar");
    }
  }
  autenticarVoto(String CodigoUsuario, int IdEleccion, File imageFile, BuildContext context ) async {
    try{
      var request = await http.MultipartRequest
        ("POST", Uri.parse("${Constants.URL}/api/Votos/AutenticarVotoReconocimientoFacial")
          );
      request.headers.addAll({"Content-type": "multipart/form-data",HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),});

      if(imageFile != null){
        request.files.add(await http.MultipartFile.fromPath('Target', imageFile.path));
        request.fields.addAll(<String, String>{'CodigoUsuario': localStorage.get('codigo').toString(), 'IdEleccion': IdEleccion.toString()});
      }
      final res = await request.send();
      final respStr = await res.stream.bytesToString();
      final responseData = json.decode(respStr);
      print(responseData["code"]);

    if (responseData["code"] == 200) {
     /* Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              FaceNoneVerify(rostro: imageFile, ElectionId: IdEleccion,)));*/

     Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              FaceVerify(rostro: imageFile, ElectionId: IdEleccion,)));
    }
    if(res.statusCode == 404 || responseData["code"] == 400) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
          FaceNoneVerify(rostro: imageFile, ElectionId: IdEleccion,)));
    }
    } catch (error){
      log(error.toString());
    }
  }

  enviarVoto(String CodigoUsuario, int IdEleccion,BuildContext context) async {
    Map data = {
      'CodigoUsuario' : CodigoUsuario,
      'IdEleccion' :IdEleccion,
    };
    var bodyRequest = json.encode(data);

    print(data);

    var response = await http.post(
        Uri.parse("${Constants.URL}/api/Votos/EnviarVoto"),
        headers: {"Content-Type": "application/json;  charset=UTF-8",
          HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),},
        body: bodyRequest);

    var jsonData =
    json.decode(Utf8Decoder().convert(response.bodyBytes).toString());

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              EnviadoVoto(ElectionId: IdEleccion,)));
    } else {
      _alert.createAlert(
          context, "Algo salió mal", "No se ha podido enviar.", "aceptar");
    }

  }

  autenticarOTP(String CodigoUsuario, int IdEleccion, String Codigo, BuildContext context) async {
    Map data = {
      'CodigoUsuario' : CodigoUsuario,
      'IdEleccion' :IdEleccion,
      'CodigoOTP' : Codigo,
    };
    var bodyRequest = json.encode(data);
    var response = await http.post(
        Uri.parse("${Constants.URL}/api/Votos/AutenticarVotoOTP"),
        headers: {"Content-Type": "application/json;  charset=UTF-8",
          HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),},
        body: bodyRequest);

    var jsonData =
    json.decode(Utf8Decoder().convert(response.bodyBytes).toString());

    if (jsonData["code"] == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              EnviarVoto(ElectionId: IdEleccion,)));
    } else {
      _alert.createAlert(
          context, "Algo salió mal", "No se ha podido autenticar.", "aceptar");
    }
  }
  enviarOTP(String CodigoUsuario, int IdEleccion,BuildContext context) async {
    Map data = {
      'CodigoUsuario' : CodigoUsuario,
      'IdEleccion' :IdEleccion,
    };
    var bodyRequest = json.encode(data);
    var response = await http.post(
        Uri.parse("${Constants.URL}/api/Votos/EnviarCodigoOTP"),
        headers: {"Content-Type": "application/json;  charset=UTF-8",
          HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),},
        body: bodyRequest);

    var jsonData =
    json.decode(Utf8Decoder().convert(response.bodyBytes).toString());


    if (jsonData["code"] == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              PhoneAuthPage(ElectionId: IdEleccion,)));
    } else {
      _alert.createAlert(
          context, "Algo salió mal", "No se ha podido enviar.", "aceptar");
    }

  }

}