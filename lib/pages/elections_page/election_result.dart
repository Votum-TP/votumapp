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
      body: Container(
        width: double.infinity,
        child: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else{
            return   Container(
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
            );
          }
          },
        ),
      )
    );
  }








}