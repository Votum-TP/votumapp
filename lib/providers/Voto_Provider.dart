import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:votum/pages/autentication_otp/otp_page.dart';
import 'package:votum/pages/face_authentication_page/authentication_page.dart';

import '../helpers/constant_helpers.dart';
import '../main.dart';
import '../pages/elections_page/VotoEnviado.dart';
import '../pages/face_authentication_page/face_noverify.dart';
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

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              AuthenticationPage(IdEleccion: IdEleccion)));
    } else {
      _alert.createAlert(
          context, "Algo salió mal", "No se ha podido confirmar.", "aceptar");
    }
  }
  autenticarVoto(String CodigoUsuario, int IdEleccion, XFile imageFile, BuildContext context ) async {
    try{
      var request = await http.MultipartRequest
        ("POST", Uri.parse("${Constants.URL}/api/Votos/AutenticarVotoReconocimientoFacial")
          );
      request.headers.addAll({"Content-type": "multipart/form-data",HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),});

      if(imageFile != null){
        request.files.add(await http.MultipartFile.fromPath('Target', imageFile.path));
        request.fields.addAll(<String, String>{'CodigoUsuario': localStorage.get('codigo').toString(), 'IdEleccion': IdEleccion.toString()});
        request.fields['CodigoUsuario'] = localStorage.get('codigo').toString();
        request.fields['IdEleccion'] = IdEleccion.toString();
      }
      final res = await request.send();
      final respStr = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              EnviadoVoto()));
    }
    if(res.statusCode == 404) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
          FaceNoneVerify(rostro: imageFile,)));
    }
    } catch (error){
      log(error.toString());
    }
  }

  enviarVoto(String CodigoUsuario, int IdEleccion) {


  }
  autenticarOTP(){

  }
  renviarOTP(){

  }

}