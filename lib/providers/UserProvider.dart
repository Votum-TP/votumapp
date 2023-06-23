import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:votum/main.dart';

import '../helpers/constant_helpers.dart';
import '../model/login_response.dart';
import '../model/receptors/ApiResponse.dart';
import '../model/user.dart';
import '../preferences/prefs.dart';
import '../utils/alert.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Alert _alert = Alert();

  static const headers = {
    // 'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };


  Future<APIResponse<LoginResponse>> login(String uID, String uPwd, BuildContext context) {
    Userlogin log=new Userlogin();
    log.codigoUsuario=uID;
    log.contrasena=uPwd;
    final correo =uID+"@upc.edu.pe";

    return http
        .post(Uri.parse("${Constants.URL}/"+'api/Login/LoginApp'),
        headers: headers, body: json.encode(log.toJson()))
        .then((data) {
      final jsonData = json.decode(data.body);
      if (jsonData['code'] == 200) {
        final jsonData = json.decode(data.body);


        localStorage.setString('token', jsonData['token'] != null ? jsonData['token']  : '');
        localStorage.setString('correo', correo != null ? correo  : '');
        localStorage.setString('codigo', uID!= null ? uID  : '');

        //_prefs.settoken = jsonData['token'];

        return APIResponse<LoginResponse>(
            data: LoginResponse.fromJson(jsonData));
      } else {
        final jsonData = json.decode(data.body);
        _alert.createAlert(
            context, "Algo salió mal", "No se ha podido confirmar.", "aceptar");

        return APIResponse<LoginResponse>(
            error: true, errorMessage: jsonData['mensaje']);
      }
      return APIResponse<LoginResponse>(
          error: true, errorMessage: 'El usuario y/o Contraseña es incorrecto');
    }).catchError((_) => APIResponse<LoginResponse>(
        error: true, errorMessage: 'An error occured'));
  }

}