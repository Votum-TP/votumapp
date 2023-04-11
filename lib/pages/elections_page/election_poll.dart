import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Partido.dart';
import 'package:votum/providers/Candidatos_Provider.dart';
import 'dart:math' as math;
import 'confirm_vote.dart';

class ElectionPoll extends StatefulWidget {
  final int userId;
  final int electionId;

  const ElectionPoll({ required this.userId, required this.electionId});

  @override
  State<ElectionPoll> createState() => _ElectionPollState();

}

class _ElectionPollState extends State<ElectionPoll>{

  PartidosProvider _partidosProvider = PartidosProvider();
  var partidos = <Partido>[];
  int? vote;
  String? name;
  String? descripcion;
  @override
  void initState() {
    // TODO: implement initState
    vote == null;
    partidos = _partidosProvider.getpartidos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                buildTextTitleVariation1('Emita su voto seguro'),

                buildTextSubTitleVariation1('Escoja la elección de su preferencia, a continuación.'),
              ],
            ),),
          Expanded(child: ListView.builder(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0),
              itemCount: partidos.length,
              itemBuilder: (BuildContext context, int index){
                Partido partido = partidos[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      vote = int.parse(partidos[index].idPartido!);
                      name = partidos[index].nombre;
                      descripcion = partidos[index].descripciN;
                      print(vote);
                    });
                  },
                  child: Container(height: 90.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white70,
                      border: Border.all(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)
                      ),
                    ),
                    margin: const EdgeInsets.all(10.0), child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/33.jpg'),

                      ),

                      title: Text(partido.nombre.toString(), style: GoogleFonts.poppins(
                          fontSize: 12),),
                      subtitle: Text(partido.descripciN.toString(), style: GoogleFonts.poppins(
                          fontSize: 12)),
                    ),),
                );
              })),
          _vote(context),
        ],
      ),
    );
  }
  buildTextTitleVariation1(String text){
  return Padding(
  padding: EdgeInsets.only(bottom: 4),
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
  padding: EdgeInsets.only(bottom: 10),
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
    padding: EdgeInsets.only(bottom: 4),
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

  Widget _vote(BuildContext context) {
    return MaterialButton(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
      color: Color(0xFF3F468F),
      onPressed: () {
        if(vote == null) {
          print('rataaaaaaaa');
        }
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ConfirmVote(Userid: widget.userId,Electionid: widget.electionId,Description: descripcion.toString(), Name: name.toString(),)));
      },
      child: Padding(
           padding: const EdgeInsets.symmetric(
           vertical: 10.0, horizontal: 42.0),
           child: Text(
                   "Votar",
              style: GoogleFonts.poppins(
               fontSize: 14),
         ),
         ),
    );
  }
}

