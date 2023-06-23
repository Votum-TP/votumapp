import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Partido.dart';
import 'package:votum/providers/Candidatos_Provider.dart';
import 'dart:math' as math;
import '../../utils/alert.dart';
import '../autentication_otp/components/app_colors.dart';
import 'confirm_vote.dart';

class ElectionPoll extends StatefulWidget {
  final int userId;
  final int electionId;

  const ElectionPoll({ required this.userId, required this.electionId});

  @override
  State<ElectionPoll> createState() => _ElectionPollState();

}

class _ElectionPollState extends State<ElectionPoll>{

  PartidosProvider voteProvider = new PartidosProvider();
  var partidos = <Partido>[];
  var partidos2 = <Partido>[];
  bool _visible = true;

  int? vote;
  String? name;
  String? descripcion;
  String? image;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      //here is the async code, you can execute any async code here
      var res = await voteProvider.getpartidos(widget.electionId.toString());
      for( var aux in res){
        partidos2.add((aux as Partido));
      }
      setState(() {
        partidos = partidos2;
        print(partidos.length);
        vote == null;
      });
    });
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    bool isVisible = true;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
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
        child: Container(
          padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 73*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 11*fem, 0*fem),
                padding: EdgeInsets.fromLTRB(9.11*fem, 0*fem, 8.89*fem, 0*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
                      padding: EdgeInsets.fromLTRB(15*fem, 12.5*fem, 0.5*fem, 1.5*fem),
                      width: double.infinity,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.22*fem, 24.11*fem),
                      width: 313*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // frame24aaP (502:165)
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // emitasuvoto6Yj (502:166)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 125*fem, 0*fem),
                                  child: Text(
                                    'Emita su voto',
                                    style: GoogleFonts.poppins(
                                      fontSize: 22*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5*ffem/fem,
                                      color: Color(0xff3f468f),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20*fem,
                          ),
                          Text(
                            // escojaelpartidodesupreferencia (502:168)
                            'Escoja el partido de su preferencia.',
                            style: GoogleFonts.poppins(
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: Color(0xff95989e),
                            ),
                          ),
                          SizedBox(
                            height: 20*fem,
                          ),
                          Text(
                            // listadeparticipantes2UK (502:169)
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
                      height: 250*fem,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: buildParticipantes(context, partidos),
                      ),
                    ),
                    _vote(context)

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _vote(BuildContext context) {
    Alert _alert = Alert();
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return AnimatedOpacity(opacity: _visible ? 0.0 : 1.0,
      duration: Duration(milliseconds: 500),
      child: MaterialButton(
        height: 41*fem,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        color: Color(0xFF3F468F),
        onPressed: () {
          if(vote == null) {
            _alert.createAlert(
                context, "Seleccione ", "No puedo ser vació", "aceptar");
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ConfirmVote(Userid: widget.userId,Electionid: widget.electionId,Description: descripcion.toString(), Name: name.toString(), Partidoid: vote,image: image.toString(),)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 42.0),
          child: Text(
            "Votar",
            style: GoogleFonts.poppins(
              fontSize: 15*ffem,
              fontWeight: FontWeight.w500,
              height: 1.5*ffem/fem,
              color: Color(0xffffffff),),
          ),
        ),
      ),
    );
  }
  List<Widget> buildParticipantes(BuildContext context, var partidos){
    List<Widget> list = [];
    for (var i = 0; i < partidos!.length; i++){
      list.add(ParticipantesCard(partidos![i], i,context));
    }
    return list;
  }
  Widget ParticipantesCard(Partido partido, int index, BuildContext context){
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: () {
                setState(() {
                  vote = partidos[index].idPartido;
                  name = partidos[index].nombre;
                  descripcion = partidos[index].descripcion;
                  image = partidos[index].imagen;
                  print(vote);
                  _visible = false;
                  print(_visible);
                });

              },
              child:Container(
                  padding: EdgeInsets.fromLTRB(14.17*fem, 13.64*fem, 14.17*fem, 13.64*fem),
                  width: double.infinity,
                  height: 81*fem,
                  decoration: BoxDecoration (
                    border: Border.all(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),width: 2.0),
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
                            partido.imagen.toString(),
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
                  )
              ),
            ),
            SizedBox( height: 20,),

          ],
        )
    );
  }
}

