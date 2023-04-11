import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Elections.dart';
import 'package:votum/pages/elections_page/Election_detail_page.dart';
import 'package:votum/widgets/Custom_drawer.dart';

import '../../providers/Elections_Provider.dart';

class VotePage extends StatefulWidget {
  @override
  State<VotePage> createState()=> _VotePageState();

}

class _VotePageState extends State<VotePage>{

  ElectionProvideer voteProvider = new ElectionProvideer();
  var elecciones = <Eleccion>[];

  @override
  void initState() {
    // TODO: implement initState
    elecciones = voteProvider.getResults();
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
      drawer: CustomDrawer(),
      body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                buildTextTitleVariation1('Participe en estas elecciones'),

                buildTextSubTitleVariation1('Se encuentra inscrito en los siguientes procesos'),
              ],
            ),),
            Expanded(child: ListView.builder(
                padding: const EdgeInsets.only(
          left: 20.0, right: 20.0),
                itemCount: elecciones.length,
                itemBuilder: (BuildContext context, int index){
                  Eleccion eleccion = elecciones[index];
                 return GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectionDetail(eleccion: elecciones[index],)));
                   },
                   child: Container(height: 90.0,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12.0),
                         color: Colors.white70
                     ),
                     margin: const EdgeInsets.all(10.0), child: ListTile(
                       leading: CircleAvatar(
                         radius: 30.0,
                         backgroundImage: NetworkImage('dadas'),

                       ),

                       trailing: Icon(Icons.chevron_right) ,
                       title: Text(eleccion.name.toString()),
                       subtitle: Text(eleccion.start.toString()),
                     ),),
                 );
            }))
          ],
      ),
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
}

