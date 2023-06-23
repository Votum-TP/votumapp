// To parse this JSON data, do
//
//     final uservet = uservetFromJson(jsonString);

import 'dart:convert';

Userlogin userloginFromJson(String str) => Userlogin.fromJson(json.decode(str));

String userToJson(Userlogin data) => json.encode(data.toJson());

class Userlogin {
  Userlogin({
 //   this.id,
     this.codigoUsuario,
 //   this.tipoDoc,
   // this.nroDoc,
     this.contrasena,

  });
/*
 */
 // int? id = 0;

  String? codigoUsuario;
 // String? tipoDoc;
 // String? nroDoc;
  String? contrasena;


  factory Userlogin.fromJson(Map<String, dynamic> json) {
    return Userlogin(
   //   id: json["id"],
      codigoUsuario: json["CodigoUsuario"],
  //    tipoDoc: json["tipoDoc"],
  //    nroDoc: json["nroDoc"],
      contrasena: json["Contrasena"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
    //  "id": id,
      "codigoUsuario": codigoUsuario,
    //   "tipoDoc":tipoDoc,
    //  "nroDoc":nroDoc,
      "contrasena": contrasena,

    };
  }
}
