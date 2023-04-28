// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({

    required this.code,
    //   required this.username,
    required this.mensaje,
    //   required this.idf,
    required this.token,

  });

  int code;

  String mensaje;

  // int ?idf;
  String token;


  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
        code: json["code"],
        //       username: json["username"],
        mensaje: json["mensaje"],
        token: json["token"],
        //      idf: json["idf"],
      );

  Map<String, dynamic> toJson() =>
      {
        "code": code,
        //      "username": username,
        "mensaje": mensaje,
        "token": token,
        //      "idf": idf,
      };
}
