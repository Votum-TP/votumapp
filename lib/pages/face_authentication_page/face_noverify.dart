import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../autentication_otp/otp_page.dart';

class FaceNoneVerify extends StatelessWidget {
  final XFile rostro;
  const FaceNoneVerify({ required this.rostro});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
                    image: AssetImage (
                      'assets/happy-path-movil/images/scanning-face-3-bg.png',
                    ),
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
                                'https://i.imgur.com/mHCi4U8.png',
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
                                    // noseidentificelrostroxbD (138:6463)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                                    child: Text(
                                      'No se le identificó',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xfff69447),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // suidentidadsehaverificadocorre (168:7274)
                                    constraints: BoxConstraints (
                                      maxWidth: 204*fem,
                                    ),
                                    child: Text(
                                      'Estimado(a) Elector(a):\nQueremos informarle que no\nse ha podido identificar\nsu rostro.',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.0*ffem/fem,
                                        color: Color(0xff95989e),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    OtpVerificationView()));
                              },
                              child: Container(
                                // buttonokF (138:6465)
                                margin: EdgeInsets.fromLTRB(38.5*fem, 0*fem, 38.5*fem, 0*fem),
                                width: double.infinity,
                                height: 41*fem,
                                decoration: BoxDecoration (
                                  color: Color(0xfff69447),
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
                                    'Verificar OTP',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5*ffem/fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            )
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