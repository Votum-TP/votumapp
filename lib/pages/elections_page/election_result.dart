import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/DetailElection.dart';
import 'package:votum/providers/Elections_Provider.dart';

import '../../main.dart';
import '../../model/DetailHolder.dart';

class ElectionResult extends StatefulWidget {
  final  CantidadVotosBlancom;
  final CantidadVotosValidos;
  final VotoEmitido;
  final electionId;

  const ElectionResult({ required this.electionId, required this.CantidadVotosBlancom, required this.CantidadVotosValidos, required this.VotoEmitido,});

  @override
  State<ElectionResult> createState() => _ElectionResultState();

}

class _ElectionResultState extends State<ElectionResult> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    ElectionProvideer electionProvideer = new ElectionProvideer();
    var totalVotos;
    var candidatos = [];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Resultados",
            style: GoogleFonts.poppins(
                fontSize: 19.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // textinfoy3h (502:122)
                margin: EdgeInsets.fromLTRB(19*fem, 15*fem, 20*fem, 0*fem),
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
                                fontSize: 23*ffem,
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
                              fontSize: 13*ffem,
                              fontWeight: FontWeight.w600,
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
              Expanded(
                  child: FutureBuilder(
                      future: electionProvideer.getPartidosResutlados(widget.electionId, localStorage.getString('codigo').toString()),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {

                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            margin: EdgeInsets.fromLTRB(10*fem, 5*fem, 5*fem, 1*fem),
                            padding: EdgeInsets.fromLTRB(9.11*fem, 9*fem, 9*fem, 0*fem),
                            width: double.infinity,
                            height: 400*fem,
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder:  (BuildContext context, int i){
                                  return  ParticipantesCard(i,snapshot.data[i], context);
                                }

                            ),
                          );
                        }
                      })),

              Expanded(child: Container(
                // informationWEX (502:155)
                margin: EdgeInsets.fromLTRB(116*fem, 58*fem, 0*fem, 0*fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // votosenblanco5yto (502:156)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                      child: Text(
                        'Votos en blanco:'+widget.CantidadVotosBlancom.toString(),
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
                      'Total de votos emitidos:'+widget.CantidadVotosValidos.toString(),
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
              ),)
            ],
          ),
        ));
  }

  List<Widget> buildParticipantes(BuildContext context, var partidos, Partidos partido) {
    List<Widget> list = [];
    for (var i = 0; i < partidos; i++) {
      list.add(ParticipantesCard(i,partido, context));
    }
    return list;
  }

  Widget ParticipantesCard(int index, Partidos partido, BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // politicpartydR5 (502:127)
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
      padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 17.11*fem, 13.64*fem),
      width: double.infinity,
      height: 81*fem,
      decoration: BoxDecoration (
        border: Border.all(color: Color(0xffc24c1b)),
        borderRadius: BorderRadius.circular(10*fem),
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
              child: Image.network(
                partido.imagen.toString(),
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
                            partido.nombre.toString(),
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
                                    ((partido.cantidadVotos!/widget.CantidadVotosValidos)*100).toString(),
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
                                partido.cantidadVotos!.toString()+"/"+widget.CantidadVotosValidos.toString(),
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
    );
  }
}