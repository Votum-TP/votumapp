import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElectionResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar:  AppBar(
      title: Text(
      "Elecciones",
      style: GoogleFonts.poppins(
          fontSize: 19.0,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
        leading: GestureDetector(
         onTap: (){
         Navigator.pop(context);
          },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        ),
      ),

    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // contentrjm (502:204)
            margin: EdgeInsets.fromLTRB(19.5*fem, 0*fem, 19.5*fem, 0*fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  // ustedestvotandopor8SP (502:205)
                  child: Container(
                    constraints: BoxConstraints (
                      maxWidth: 139*fem,
                    ),
                    child: Text(
                      'Usted está \nvotando por',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 22*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5*ffem/fem,
                        color: Color(0xff3f468f),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 52*fem,
                ),
                Container(
                  // politicpartyVgF (502:207)
                  padding: EdgeInsets.fromLTRB(14.17*fem, 11.81*fem, 15.5*fem, 13.81*fem),
                  width: double.infinity,
                  height: 176.07*fem,
                  decoration: BoxDecoration (
                    border: Border.all(color: Color(0xffc31abd)),
                    borderRadius: BorderRadius.circular(4.7242808342*fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0*fem, 1.8897122145*fem),
                        blurRadius: 0.9448561072*fem,
                      ),
                    ],
                  ),
                  child: Container(
                    // frame18Uo5 (502:208)
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // avaBhV (502:209)
                          margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 19*fem, 0*fem),
                          width: 92.33*fem,
                          height: 92.33*fem,
                          child: Image.asset(
                            'assets/mockups-movil/images/ava--6Cj.png',
                            width: 92.33*fem,
                            height: 92.33*fem,
                          ),
                        ),
                        Container(
                          // description1Rd (502:212)
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // partidoorganizate6T5 (502:213)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.72*fem),
                                child: Text(
                                  'Partido Organizate',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff9f2e64),
                                  ),
                                ),
                              ),
                              Container(
                                // representantemarcocorreawTh (502:214)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6.72*fem),
                                child: Text(
                                  'Representante: Marco Correa',
                                  style: GoogleFonts.poppins(
                                    fontSize: 9*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // propuestasloremipsumloremlores (502:215)
                                constraints: BoxConstraints (
                                  maxWidth: 180*fem,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.poppins(
                                      fontSize: 9*ffem,
                                      fontWeight: FontWeight.w300,
                                      height: 1.5*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '\n',
                                      ),
                                      TextSpan(
                                        text: 'Propuestas:\n',
                                        style: GoogleFonts.poppins(
                                          fontSize: 9*ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff9f2e64),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '-Lorem Ipsum lorem loresum loresumito\nadd more lorem\n-Lorem Ipsum lorem loresum loresumito\n-Lorem Ipsum lorem loresum loresumito\n-Lorem Ipsum lorem loresum loresumito\n-Lorem Ipsum lorem loresum loresumito',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 52*fem,
                ),
                Container(
                  // buttonstjd (502:216)
                  margin: EdgeInsets.fromLTRB(89.5*fem, 0*fem, 89.5*fem, 0*fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // buttonZqm (502:217)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                        width: double.infinity,
                        height: 41*fem,
                        decoration: BoxDecoration (
                          color: Color(0xff0b9bf5),
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
                            'CONFIRMAR',
                            style: GoogleFonts.poppins(
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        // volverXRD (502:219)
                        'Volver',
                        style: GoogleFonts.poppins(
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          decoration: TextDecoration.underline,
                          color: Color(0xff3f468f),
                          decorationColor: Color(0xff3f468f),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}