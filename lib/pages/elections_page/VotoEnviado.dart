import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnviadoVoto extends StatelessWidget {
  final ElectionId;

  const EnviadoVoto({super.key, required this.ElectionId});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
     return Scaffold(
       appBar: AppBar(
         title: Text(
           "Estado del Voto",
           style: GoogleFonts.poppins(
               fontSize: 19.0,
               color: Colors.white,
               fontWeight: FontWeight.bold),
         ),
         leading: GestureDetector(
           onTap: (){
             Navigator.pop(context);
           },

         ),
       ),
       body:  Container(
       width: double.infinity,
       child: Container(
         // votorealizadovks (502:70)
         padding: EdgeInsets.fromLTRB(0*fem, 80*fem, 0*fem, 169*fem),
         width: double.infinity,
         decoration: BoxDecoration (
           color: Color(0xffffffff),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(height: 40,),
             Container(
               margin: EdgeInsets.fromLTRB(65.5*fem, 0*fem, 65.5*fem, 0*fem),
               width: double.infinity,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Center(
                     // votorealizadoAaf (502:72)
                     child: Container(
                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 29.5*fem),
                       constraints: BoxConstraints (
                         maxWidth: 106*fem,
                       ),
                       child: Text(
                         'Voto\nrealizado',
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(
                           fontSize: 22*ffem,
                           fontWeight: FontWeight.w700,
                           height: 1.5*ffem/fem,
                           color: Color(0xff3f468f),
                         ),
                       ),
                     ),
                   ),
                   Center(
                     // estimadoaelectoraqueremosinfor (502:73)
                     child: Container(
                       margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 46.5*fem),
                       constraints: BoxConstraints (
                         maxWidth: 229*fem,
                       ),
                       child: Text(
                         'Estimado(a) Elector(a):\nQueremos informarle que su \nparticipación ha sido registrada \nsatisfactoriamente.',
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(
                           fontSize: 14*ffem,
                           fontWeight: FontWeight.w400,
                           height: 1.5*ffem/fem,
                           color: Color(0xff95989e),
                         ),
                       ),
                     ),
                   ),
                   Container(
                     // buttonkSP (502:74)
                     margin: EdgeInsets.fromLTRB(43.5*fem, 0*fem, 43.5*fem, 0*fem),
                     width: double.infinity,
                     height: 41*fem,
                     decoration: BoxDecoration (
                       color: Color(0xff3f468f),
                       borderRadius: BorderRadius.circular(10*fem),
                       boxShadow: [
                         BoxShadow(
                           color: Color(0x3f000000),
                           offset: Offset(0*fem, 8*fem),
                           blurRadius: 5*fem,
                         ),
                       ],
                     ),
                     child: TextButton(
                       onPressed: (){
                         Navigator.pushNamed(context, 'elections');
                       },
                       child: Center(
                         child: Text(
                           'Continuar',
                           style: GoogleFonts.poppins(
                             fontSize: 11*ffem,
                             fontWeight: FontWeight.w500,
                             height: 1.5*ffem/fem,
                             color: Color(0xffffffff),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             )
           ],
         ),
       ),
     ),
     );
  }
  
}