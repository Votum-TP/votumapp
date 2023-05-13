

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Candidatos.dart';
import 'package:votum/model/DetailElection.dart';
import 'package:votum/model/Election.dart';
import 'package:votum/model/Partido.dart';
import 'package:votum/pages/elections_page/election_page.dart';
import 'package:votum/pages/elections_page/election_poll.dart';
import 'package:votum/pages/elections_page/election_result.dart';
import 'package:votum/pages/instruction_page/instruction.dart';
import 'package:votum/providers/Candidatos_Provider.dart';
import 'package:votum/providers/Elections_Provider.dart';
import 'package:votum/widgets/Custom_Dialog.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../helpers/constant_helpers.dart';
import '../../main.dart';
import '../../model/DetailHolder.dart';
import '../../model/Eleccion.dart';
class ElectionDetail extends StatefulWidget {

  final Election eleccion;

  ElectionDetail({ required this.eleccion});

  @override
  State<ElectionDetail> createState()=> _ElectionDetailState();
}

class _ElectionDetailState extends State<ElectionDetail> {
  PartidosProvider voteProvider = new PartidosProvider();
  ElectionProvideer electionProvideer = new ElectionProvideer();
  var partidos = <Partido>[];
  var partidos2 = <Partido>[];
  bool isbuttonVisible = false;
  bool isWinnerVisible = false;
  int? CantidadVotosBlancom,CantidadVotosValidos;
  bool? VotoEmitido;
  late final DetailHolder detalleresultado;


  getResultado() async {

      final response = await http.get(
        Uri.parse("${Constants.URL}/api/Elecciones/DetalleEleccionMovil/"+widget.eleccion.idEleccion.toString()+"/"+localStorage.get('codigo').toString()),
        // Send authorization headers to the backend.
        headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: 'Bearer ' + localStorage.get('token').toString(),
        },
      );


      final responseJson = json.decode(Utf8Decoder().convert(response.bodyBytes).toString());


      if(response.statusCode == 200){

        CantidadVotosBlancom = responseJson["CantidadVotosBlancos"];
        CantidadVotosValidos = responseJson["CantidadVotosValidos"];
        VotoEmitido = responseJson["VotoEmitido"];
        print(CantidadVotosValidos);
        //final aux = DetailHolder(nombre: responseJson["Nombre"], descripcion: responseJson["Descripcion"], fechaInicio: responseJson["FechaInicio"], estado: responseJson["Estado"], cantidadVotosBlancos: responseJson["CantidadVotosBlancos"], cantidadVotosValidos: responseJson["CantidadVotosValidos"], votoEmitido: responseJson["VotoEmitido"], fechaFin: responseJson["FechaFin"], partidos: null,);
      } else {
        print('Something went wrong. \nResponse Code : ${response.statusCode}');

      }
  }


  @override
  void initState() {
    getResultado();

    if(widget.eleccion.estado=='iniciado'){
      isbuttonVisible = true;
    } else{
      detalleresultado = DetailHolder(cantidadVotosBlancos: CantidadVotosBlancom, cantidadVotosValidos: CantidadVotosValidos, votoEmitido: VotoEmitido);
      print(detalleresultado);
    }

    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      //here is the async code, you can execute any async code here
      var res = await voteProvider.getpartidos(widget.eleccion.idEleccion.toString());


     /* for( var aux in res){
        partidos2.add((aux as Partido));
      }*/
      setState(() {
        partidos = partidos2;

      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


    var candidatos = [];
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Eleccion",
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
        body: SingleChildScrollView(child:       Container(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 41*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 30*fem),
                  padding: EdgeInsets.fromLTRB(15*fem, 0*fem, 225.37*fem, 0*fem),
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 11*fem, 0*fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 18*fem, 15*fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints (
                                maxWidth: 151*fem,
                              ),
                              child: Text(
                                widget.eleccion.nombre.toString(),
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
                              // lapresenteeleccintienecomofine (502:230)
                              constraints: BoxConstraints (
                                maxWidth: 311*fem,
                              ),
                              child: Text(
                                widget.eleccion.descripcion.toString(),
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
                              // listadeparticipantesEHy (502:231)
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
                        margin: EdgeInsets.fromLTRB(10*fem, 5*fem, 10*fem, 10*fem),
                        padding: EdgeInsets.fromLTRB(9.11*fem, 9.11*fem, 8.89*fem, 0*fem),
                        width: double.infinity,
                        height: 210*fem,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: buildParticipantes(context, partidos),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 18*fem, 15*fem),
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(isbuttonVisible) ... [
                                  Center(child: MaterialButton(
                                    height: 40*fem,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                    color: Color(0xFF3F468F),
                                    onPressed: () {
                                      crearAlert(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 42.0),
                                      child: Text(
                                          "Comenzar",
                                          style: GoogleFonts.poppins(
                                              fontSize: 11*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xffffffff))
                                      ),
                                    ),

                                  ),)
                                ]
                                else ...[
                                  Container(
                                    // ganadoraHR (502:106)
                                    margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 18*fem, 15*fem),
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
                                  GanadorCard(Partido())
                                ]
                              ])),

                      /*MaterialButton(
                        height: 40*fem,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        color: Color(0xFF3F468F),
                        onPressed: () {
                          crearAlert(context);

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: Text(
                              "Comenzar",
                              style: GoogleFonts.poppins(
                                  fontSize: 11*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xffffffff))
                          ),
                        ),

                      )*/
                    ],
                  ),
                )

              ],
            ),
          ),
        ),)

    );
  }


  /*List<Widget> buildParticipantes(){
    List<Widget> list = [];
    for (var i = 0; i < eleccion.candidatos!.length; i++){
     list.add(buildCandidatos(eleccion.candidatos![i], i));
    }
    return list;
  }*/

  List<Widget> buildParticipantes(BuildContext context, var partidos){
    List<Widget> list = [];
    for (var i = 0; i < partidos!.length; i++){
      list.add(ParticipantesCard(partidos![i], i,context));
    }
    return list;
  }

  void crearAlert(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 66 + 16,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              margin: EdgeInsets.only(top: 66),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    'Comenzar elección',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Emitirá su voto en unos instantes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Volver',style: GoogleFonts.poppins(),),
                          ),
                          SizedBox(width: 50,),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> InstructionScreen(electionId: widget.eleccion.idEleccion.toString(),)));
                            },
                            child: Text('Comenzar',style: GoogleFonts.poppins(),),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Color(0xffF69447),
                radius: 66,
                child: Icon(
                  Icons.report_gmailerrorred,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
      /*return AlertDialog(
        backgroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        title: Padding(
          padding: EdgeInsets.only(top:10.0),
          child: Center(
            child: Text('Términos y condiciones',
              style: GoogleFonts.poppins(
                  fontSize: 17),
            ),
          ),
        ),
        content: Text('Comenzar el proceso de voto',style: TextStyle(
            color: Colors.black,
            fontSize: 13.0,
            fontFamily: "Poppins"),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectionPoll(userId: 1, electionId: int.parse(widget.eleccion.Id.toString()),)));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text("okay",style: TextStyle(
                  color: Color(0xFF3F468F),
                  fontSize: 15.0,
                  fontFamily: "Poppins"),),
            ),
          ),
        ],
      );*/

    });
  }

  /*Widget buildCandidatos(Candidatos candidato, int index){

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.all(
          Radius.circular(20),

        ),
          border: Border.all(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0))


      ),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
    padding: EdgeInsets.all(16),
    width: 220,
      child: AspectRatio(
        aspectRatio: 6.4/10,
        child: Column(
          children: [ Expanded(
            child: Hero(
              tag: 'imagen',
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://randomuser.me/api/portraits/men/42.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
            SizedBox(height: 8),
            Text(
              eleccion.candidatos![index].name.toString(),
              style: TextStyle( fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),],
        ),
      ),
    );
  }*/
  Widget ParticipantesCard(Partido partido, int index, BuildContext context){
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 14.17*fem, 13.64*fem),
              width: double.infinity,
              height: 81*fem,
              decoration: BoxDecoration (
                border: Border.all(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                borderRadius: BorderRadius.circular(10*fem),
              ),
              child: Container(

                // frame18z4B (502:234)
                width: 205.72*fem,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // avatQT (502:235)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                      width: 53.72*fem,
                      height: 53.72*fem,
                      child: Image.network(
                        'https://i.imgur.com/CwA8qP6.png',
                        width: 53.72*fem,
                        height: 53.72*fem,
                      ),
                    ),
                    Container(
                      // descriptionuqM (502:238)
                      margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 9*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // partidoorganizateaRh (502:239)
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
                            // representantemarcocorreaQvX (502:240)
                            'Representante: Marco Correa',
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
            SizedBox( height: 20,),

          ],
        )
    );
  }
  Widget GanadorCard(Partido partido){
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: (){
        //print(detalleresultado);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectionResult(electionId: widget.eleccion.idEleccion, CantidadVotosBlancom: CantidadVotosBlancom,CantidadVotosValidos: CantidadVotosValidos,VotoEmitido: VotoEmitido,)));
      },
      
      child: Container(
      // politicpartye2P (502:107)
      margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 0*fem, 0*fem),
      padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 5.17*fem, 8.64*fem),
      width: double.infinity,
      height: 80*fem,
      decoration: BoxDecoration (
        border: Border.all(color: Color(0xffc24c1b)),
        borderRadius: BorderRadius.circular(10*fem),
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
                  child: Image.network(
                    widget.eleccion.ganador!.imagen.toString(),
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
                          widget.eleccion.ganador!.nombre.toString(),
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
            child: Image.network(
              'https://i.imgur.com/hZX2Vmz.png',
              width: 6.94*fem,
              height: 12.14*fem,
            ),
          ),
        ],
      ),
    ),);
  }
}