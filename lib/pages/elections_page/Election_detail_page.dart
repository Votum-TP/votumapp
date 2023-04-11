import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Candidatos.dart';
import 'package:votum/model/Elections.dart';
import 'package:votum/pages/elections_page/election_page.dart';
import 'package:votum/pages/elections_page/election_poll.dart';
import 'dart:math' as math;
class ElectionDetail extends StatelessWidget {

  final Eleccion eleccion;


  ElectionDetail({ required this.eleccion});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                buildTextTitleVariation1(eleccion.name.toString()),

                buildTextSubTitleVariation1(eleccion.description.toString()),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),

          Container(
            height: 300,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildParticipantes(),
            ),
          ),
          SizedBox(
            height: 16,
          ),

          MaterialButton(

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
                      fontSize: 10,color: Colors.white)
              ),
            ),

          ),


        ],
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

  List<Widget> buildParticipantes(){
    List<Widget> list = [];
    for (var i = 0; i < eleccion.candidatos!.length; i++){
     list.add(buildCandidatos(eleccion.candidatos![i], i));
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectionPoll(userId: 1, electionId: int.parse(eleccion.id.toString()),)));
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

  Widget buildCandidatos(Candidatos candidato, int index){

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
  }
}