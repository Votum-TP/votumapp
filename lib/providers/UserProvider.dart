import 'dart:convert';

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
  final _prefs = new PreferenciasUsuario();


  Future<APIResponse<LoginResponse>> login(String uID, String uPwd) {
    final url = _prefs.geturl;
    Userlogin log=new Userlogin();
    log.codigoUsuario=uID;
    log.contrasena=uPwd;
    _prefs.setemail=uID+"@upc.edu.pe";
    _prefs.setpass=uPwd;

    return http
        .post(Uri.parse("${Constants.URL}/"+'api/Login/LoginApp'),
        headers: headers, body: json.encode(log.toJson()))
        .then((data) {
      final jsonData = json.decode(data.body);
      if (jsonData['code'] == 200) {
        final jsonData = json.decode(data.body);

        _prefs.settoken = jsonData['token'];

        return APIResponse<LoginResponse>(
            data: LoginResponse.fromJson(jsonData));
      }

      if (data.statusCode == 400||data.statusCode == 409) {
        final jsonData = json.decode(data.body);

        return APIResponse<LoginResponse>(
            error: true, errorMessage: jsonData['msg']);
      }
      return APIResponse<LoginResponse>(
          error: true, errorMessage: 'El usuario y/o Contraseña es incorrecto');
    }).catchError((_) => APIResponse<LoginResponse>(
        error: true, errorMessage: 'An error occured'));
  }

}