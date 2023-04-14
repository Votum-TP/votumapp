

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Candidatos.dart';
import 'package:votum/model/Partido.dart';
import 'package:votum/pages/elections_page/election_page.dart';
import 'package:votum/pages/elections_page/election_poll.dart';
import 'package:votum/providers/Candidatos_Provider.dart';
import 'dart:math' as math;

import '../../model/Eleccion.dart';
class ElectionDetail extends StatefulWidget {

  final Eleccion eleccion;

  ElectionDetail({ required this.eleccion});

  @override
  State<ElectionDetail> createState()=> _ElectionDetailState();
}

class _ElectionDetailState extends State<ElectionDetail> {
  PartidosProvider voteProvider = new PartidosProvider();
  var partidos = <Partido>[];
  var partidos2 = <Partido>[];
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      //here is the async code, you can execute any async code here
      var res = await voteProvider.getpartidos(widget.eleccion.Id.toString());
      for( var aux in res){
        partidos2.add((aux as Partido));
      }
      setState(() {
        partidos = partidos2;
        print(partidos.length);
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
        body: Container(
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
                  padding: EdgeInsets.fromLTRB(15*fem, 2.5*fem, 225.37*fem, 0*fem),
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
                                widget.eleccion.Nombre.toString(),
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
                                'La presente elección tiene como fin elegir\na los representantes de las facultades de la \nUniversidad Nacional Federico Villareal\na través de los partidos participantes.',
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
                        margin: EdgeInsets.fromLTRB(10*fem, 5*fem, 10*fem, 20*fem),
                        padding: EdgeInsets.fromLTRB(9.11*fem, 9.11*fem, 8.89*fem, 0*fem),
                        width: double.infinity,
                        height: 229*fem,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: buildParticipantes(context, partidos),
                        ),
                      ),
                      MaterialButton(
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

                      ),



                    ],
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
  buildTextTitleVariation1(String text){
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    );
  }

  buildTextTitleVariation2(String text, bool opacity){
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: opacity ? Colors.grey[400] : Colors.black,
        ),
      ),
    );
  }

  buildTextSubTitleVariation1(String text){
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  buildTextSubTitleVariation2(String text){
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.grey[400],
        ),
      ),
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
      return AlertDialog(
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
      );
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
}