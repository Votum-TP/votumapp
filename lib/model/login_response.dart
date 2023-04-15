// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({

    required this.id,
    //   required this.username,
    required this.rol,
    required this.rolId,
    //   required this.idf,
    required this.token,
  });

  String id;

  // String ?username;
  String rol;
  String rolId;

  // int ?idf;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
        id: json["id"],
        //       username: json["username"],
        rol: json["rol"],
        rolId: json["rolId"],
        //      idf: json["idf"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        //      "username": username,
        "rol": rol,
        "rolId": rolId,
        //      "idf": idf,
        "token": token,
      };
}
