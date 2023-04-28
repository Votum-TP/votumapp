import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // ganadorXT1 (502:80)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // navigationbarDKq (502:116)
              padding: EdgeInsets.fromLTRB(15*fem, 12.5*fem, 225.37*fem, 12.5*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xff0b9bf5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // barssolid11fSj (502:117)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 27*fem, 0*fem),
                    width: 17.63*fem,
                    height: 15.11*fem,
                    child: Image.asset(
                      'assets/mockups-movil/images/bars-solid-1-1.png',
                      width: 17.63*fem,
                      height: 15.11*fem,
                    ),
                  ),
                  Text(
                    // eleccionVwZ (502:119)
                    'Eleccion',
                    style: GoogleFonts.poppins(
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupbr1rZwR (2AZDUqkRQGGeVX9jmHBr1R)
              padding: EdgeInsets.fromLTRB(10*fem, 30*fem, 14*fem, 37*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // content3rb (502:82)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 12*fem),
                    width: 331*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // textinfo8NF (502:83)
                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 4*fem, 15*fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // departamentoacadmicocYK (502:84)
                                constraints: BoxConstraints (
                                  maxWidth: 171*fem,
                                ),
                                child: Text(
                                  'Departamento \nacadémico',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20*fem,
                              ),
                              Container(
                                // lapresenteeleccintienecomofine (502:85)
                                constraints: BoxConstraints (
                                  maxWidth: 317*fem,
                                ),
                                child: Text(
                                  'La presente elección tiene como fin elegir\na las autoridades representantes del \ndepartamento académico de la Universidad \nNacional Federico Villareal',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff95989e),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20*fem,
                              ),
                              Text(
                                // listadeparticipantesPL7 (502:87)
                                'Lista de participantes',
                                style: GoogleFonts.poppins(
                                  fontSize: 11*ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xff3f468f),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // listproccesssWB (502:88)
                          margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 0*fem, 27*fem),
                          width: 321*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // politicpartyY6X (502:89)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                                padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 14.17*fem, 13.64*fem),
                                width: double.infinity,
                                height: 81*fem,
                                decoration: BoxDecoration (
                                  border: Border.all(color: Color(0xff95989e)),
                                  borderRadius: BorderRadius.circular(10*fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(0*fem, 1.8897122145*fem),
                                      blurRadius: 0.9448561072*fem,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  // frame18MJs (502:90)
                                  width: 207.72*fem,
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avaqE3 (502:91)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                                        width: 53.72*fem,
                                        height: 53.72*fem,
                                        child: Image.asset(
                                          'assets/mockups-movil/images/ava--MaB.png',
                                          width: 53.72*fem,
                                          height: 53.72*fem,
                                        ),
                                      ),
                                      Container(
                                        // descriptionV3h (502:94)
                                        margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 9*fem),
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // partidoyabastaBBR (502:95)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.72*fem),
                                              child: Text(
                                                'Partido Ya Basta',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // representanteaugustorojasqWs (502:96)
                                              'Representante: Augusto Rojas',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: Color(0xff95989e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                // politicpartyvoD (502:97)
                                padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 14.17*fem, 13.64*fem),
                                width: double.infinity,
                                height: 81*fem,
                                decoration: BoxDecoration (
                                  border: Border.all(color: Color(0xff95989e)),
                                  borderRadius: BorderRadius.circular(10*fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(0*fem, 1.8897122145*fem),
                                      blurRadius: 0.9448561072*fem,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  // frame18wTR (502:98)
                                  width: 203.72*fem,
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avaeMq (502:99)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                                        width: 53.72*fem,
                                        height: 53.72*fem,
                                        child: Image.asset(
                                          'assets/mockups-movil/images/ava--ikK.png',
                                          width: 53.72*fem,
                                          height: 53.72*fem,
                                        ),
                                      ),
                                      Container(
                                        // descriptionKTy (502:102)
                                        margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 9*fem),
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // partidoprogrecxs (502:103)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.72*fem),
                                              child: Text(
                                                'Partido Progre',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5*ffem/fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // representantejavieralhuayHJK (502:104)
                                              'Representante: Javier Alhuay',
                                              style: GoogleFonts.poppins(
                                                fontSize: 9*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: Color(0xff95989e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // ganadoraHR (502:106)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                          child: Text(
                            'Ganador',
                            style: GoogleFonts.poppins(
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              color: Color(0xff3f468f),
                            ),
                          ),
                        ),
                        Container(
                          // politicpartye2P (502:107)
                          margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 1*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 22.17*fem, 13.64*fem),
                          width: double.infinity,
                          height: 81*fem,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xffc24c1b)),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 1.8897122145*fem),
                                blurRadius: 0.9448561072*fem,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame18RhM (502:108)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 70*fem, 0*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // ava6Yb (502:109)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                                      width: 53.72*fem,
                                      height: 53.72*fem,
                                      child: Image.asset(
                                        'assets/mockups-movil/images/ava--gWf.png',
                                        width: 53.72*fem,
                                        height: 53.72*fem,
                                      ),
                                    ),
                                    Container(
                                      // descriptionAYT (502:112)
                                      margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 9*fem),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // partidoyabastarRH (502:113)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.72*fem),
                                            child: Text(
                                              'Partido Ya Basta',
                                              style: GoogleFonts.poppins(
                                                fontSize: 11*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // representanteaugustorojasvg3 (502:114)
                                            'Representante: Augusto Rojas',
                                            style: GoogleFonts.poppins(
                                              fontSize: 9*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff95989e),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // vectorQbD (502:115)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                width: 6.94*fem,
                                height: 12.14*fem,
                                child: Image.asset(
                                  'assets/mockups-movil/images/vector-58P.png',
                                  width: 6.94*fem,
                                  height: 12.14*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    // presionaelitemparaverelresulta (502:81)
                    'Presiona el item para ver el resultado  ',
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: Color(0xff3f468f),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}