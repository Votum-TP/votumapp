import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElectionResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    var candidatos = [];
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
      body: Container(
        width: double.infinity,
        child: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else{
            return Container(
              width: double.infinity,
              child: Container(
                // resultadoiCK (502:120)
                padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 237*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // navigationbarkuh (502:158)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 30*fem),
                      padding: EdgeInsets.fromLTRB(15*fem, 12.5*fem, 99.37*fem, 12.5*fem),
                      width: double.infinity,
                    ),
                    Container(
                      // contenthM5 (502:121)
                      margin: EdgeInsets.fromLTRB(19*fem, 0*fem, 20*fem, 0*fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // textinfoy3h (502:122)
                            margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // departamentoacadmicoST5 (502:123)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
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
                                Text(
                                  // listadeparticipantesTsy (502:125)
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
                          SizedBox(
                            height: 15*fem,
                          ),
                          Container(
                            // listproccessJtb (502:126)
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // politicpartydR5 (502:127)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                                  padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 17.11*fem, 13.64*fem),
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
                                  child: Container(
                                    // frame18DPH (502:128)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // avavHh (502:129)
                                          width: 53.72*fem,
                                          height: 53.72*fem,
                                          child: Image.asset(
                                            'assets/mockups-movil/images/ava--4YK.png',
                                            width: 53.72*fem,
                                            height: 53.72*fem,
                                          ),
                                        ),
                                        Container(
                                          // autogroupjyxtzHZ (2AZC1dhQ6puJXB8UMejYxT)
                                          padding: EdgeInsets.fromLTRB(19*fem, 2.86*fem, 0*fem, 2.86*fem),
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // descriptionf8o (502:132)
                                                margin: EdgeInsets.fromLTRB(0*fem, 6.14*fem, 19*fem, 6.14*fem),
                                                height: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // partidoyabastakAF (502:133)
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
                                                      // representanteaugustorojaso8X (502:134)
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
                                              Container(
                                                // percentage67d (502:135)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                                width: 63*fem,
                                                height: 42.5*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // numberNL3 (502:136)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Container(
                                                        width: 63*fem,
                                                        height: 27*fem,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              // Et3 (502:137)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                                                              child: Text(
                                                                '69.48',
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 18*ffem,
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 1.5*ffem/fem,
                                                                  color: Color(0xffc24c1b),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              // 69Z (502:138)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 1.5*fem, 0*fem, 0*fem),
                                                              child: Text(
                                                                '%',
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 11*ffem,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1.5*ffem/fem,
                                                                  color: Color(0xffc24c1b),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // a4j (502:140)
                                                      left: 16.5*fem,
                                                      top: 25.5*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 46*fem,
                                                          height: 17*fem,
                                                          child: Text(
                                                            '148 / 213',
                                                            textAlign: TextAlign.right,
                                                            style: GoogleFonts.poppins(
                                                              fontSize: 11*ffem,
                                                              fontWeight: FontWeight.w600,
                                                              height: 1.5*ffem/fem,
                                                              color: Color(0xffc24c1b),
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
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  // politicpartyZhM (502:141)
                                  padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 19.11*fem, 13.64*fem),
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
                                    // frame18z1y (502:142)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // avatt3 (502:143)
                                          width: 53.72*fem,
                                          height: 53.72*fem,
                                          child: Image.asset(
                                            'assets/mockups-movil/images/ava--fjH.png',
                                            width: 53.72*fem,
                                            height: 53.72*fem,
                                          ),
                                        ),
                                        Container(
                                          // autogroupmvpqnCj (2AZCm2ckwuRxeGcxL8mVPq)
                                          padding: EdgeInsets.fromLTRB(19*fem, 2.86*fem, 0*fem, 2.86*fem),
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // descriptionG7u (502:146)
                                                margin: EdgeInsets.fromLTRB(0*fem, 6.14*fem, 28*fem, 6.14*fem),
                                                height: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // partidoprogreKM5 (502:147)
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
                                                      // representantejavieralhuayywR (502:148)
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
                                              Container(
                                                // percentagefpF (502:149)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                                width: 56*fem,
                                                height: 42.5*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // numberLvP (502:150)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Container(
                                                        width: 56*fem,
                                                        height: 27*fem,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              // DUP (502:151)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                                              child: Text(
                                                                '28.17',
                                                                textAlign: TextAlign.right,
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 18*ffem,
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 1.5*ffem/fem,
                                                                  color: Color(0xff1c5e2f),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              // 2gj (502:152)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 1.5*fem, 0*fem, 0*fem),
                                                              child: Text(
                                                                '%',
                                                                style: GoogleFonts.poppins(
                                                                  fontSize: 11*ffem,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1.5*ffem/fem,
                                                                  color: Color(0xff1c5e2f),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // WM1 (502:154)
                                                      left: 12.5*fem,
                                                      top: 25.5*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 42*fem,
                                                          height: 17*fem,
                                                          child: Text(
                                                            '60 / 213',
                                                            textAlign: TextAlign.right,
                                                            style: GoogleFonts.poppins(
                                                              fontSize: 11*ffem,
                                                              fontWeight: FontWeight.w600,
                                                              height: 1.5*ffem/fem,
                                                              color: Color(0xff1c5e2f),
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15*fem,
                          ),
                          Container(
                            // informationWEX (502:155)
                            margin: EdgeInsets.fromLTRB(116*fem, 0*fem, 0*fem, 0*fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // votosenblanco5yto (502:156)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                                  child: Text(
                                    'Votos en blanco: 5',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5*ffem/fem,
                                      color: Color(0xff1b2ac2),
                                    ),
                                  ),
                                ),
                                Text(
                                  // totaldevotosemitidos213SXV (502:157)
                                  'Total de votos emitidos: 213',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff1b2ac2),
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
              ),
            );
          }
          },
        ),
      )
    );
  }

  List<Widget> buildParticipantes(BuildContext context, var partidos){
    List<Widget> list = [];
    for (var i = 0; i < partidos!.length; i++){
      list.add(ParticipantesCard( i,context));
    }
    return list;
  }
  Widget ParticipantesCard( int index, BuildContext context){
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // informationWEX (502:155)
      margin: EdgeInsets.fromLTRB(116*fem, 0*fem, 0*fem, 0*fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            // votosenblanco5yto (502:156)
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
            child: Text(
              'Votos en blanco: 5',
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 14*ffem,
                fontWeight: FontWeight.w400,
                height: 1.5*ffem/fem,
                color: Color(0xff1b2ac2),
              ),
            ),
          ),
          Text(
            // totaldevotosemitidos213SXV (502:157)
            'Total de votos emitidos: 213',
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
              fontSize: 14*ffem,
              fontWeight: FontWeight.w600,
              height: 1.5*ffem/fem,
              color: Color(0xff1b2ac2),
            ),
          ),
        ],
      ),
    );
  }


/*Container(
              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 118.89*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                ],
              ),
            );*/



}