import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/providers/Voto_Provider.dart';

import '../../main.dart';

class EnviarVoto extends StatelessWidget {
  final ElectionId;
  const EnviarVoto({ required this.ElectionId});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    VotoProvider votoProvider = new VotoProvider();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Autenticación",
          style: GoogleFonts.poppins(
              fontSize: 19.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),

      ),
      body: Container(
        width: double.infinity,
        child: Container(
          // autenticacionparte3iFD (168:7242)
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container(
                // autogroupqh3qt59 (ATVn7kTB4GApdUetqxQh3q)
                width: double.infinity,
                height: 400*fem,
                decoration: BoxDecoration (
                  image: DecorationImage (
                    image: AssetImage("assets/xxx.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  // opaquePXh (168:7265)
                  padding: EdgeInsets.fromLTRB(0*fem, 125.5*fem, 0*fem, 0*fem),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration (
                    color: Color(0x7f2e2e2e),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // responsecontenttUT (168:7266)
                        margin: EdgeInsets.fromLTRB(22.5*fem, 0*fem, 22.5*fem, 84.5*fem),
                        padding: EdgeInsets.fromLTRB(55.5*fem, 40*fem, 55.5*fem, 53.4*fem),
                        width: double.infinity,
                        decoration: BoxDecoration (
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10*fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // checkZKh (168:7267)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                              width: 65.33*fem,
                              height: 68.6*fem,
                              child: Image.network(
                                'https://i.imgur.com/dKamYL2.png',
                                width: 65.33*fem,
                                height: 68.6*fem,
                              ),
                            ),
                            Container(
                              // frame4k9H (168:7272)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // felicitacionesTZV (168:7273)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                                    child: Text(
                                      'Felicitaciones',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xff2ecc71),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // suidentidadsehaverificadocorre (168:7274)
                                    constraints: BoxConstraints (
                                      maxWidth: 204*fem,
                                    ),
                                    child: Text(
                                      'Su identidad se ha verificado\ncorrectamente',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xff95989e),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              // buttonG9Z (168:7275)
                              margin: EdgeInsets.fromLTRB(31*fem, 0*fem, 31*fem, 0*fem),
                              child: TextButton(
                                onPressed: () {
                                  votoProvider.enviarVoto(localStorage.get('codigo').toString(), ElectionId,context);
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 41*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0xff3f468f),
                                    borderRadius: BorderRadius.circular(10*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0*fem, 8*fem),
                                        blurRadius: 5*fem,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Enviar voto',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );

  }



}