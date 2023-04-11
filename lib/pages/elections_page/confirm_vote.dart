import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/providers/Voto_Provider.dart';

class ConfirmVote extends StatelessWidget {
  final Userid;
  final Electionid;
  final String Description;
  final String Name;

  //var _votoProvider = VotoProvider();

  const ConfirmVote({ required this.Userid, required this.Electionid, required this.Description, required this.Name});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Verificar voto",
            style: GoogleFonts.poppins(
                fontSize: 19.0,
                color: Colors.white,
                ),
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
    child: SafeArea(
    child: Center(
      child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Usted está ',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xff3F468F)
                    )
                ),),
              Text('votando por',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xff3F468F)
                    )
                ),),
            ],
          ),
          cardConfirmed(),
          SizedBox(height: 10,),
          ConfirmarButton(),
        ],
      ) ,
    ),
    ),

    ),

    ),
    );



  }

  Widget cardConfirmed(){

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.all(
            Radius.circular(20),

          ),
          border: Border.all(color: Color(0XFFC31ABD))


      ),
      margin: EdgeInsets.only(right: 16, left:16, bottom: 16, top: 8),
      padding: EdgeInsets.all(16),
      width: 300,
      height: 300,
      child: AspectRatio(
        aspectRatio: 6.4/10,
        child: Row(
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
            Column(
              children: [
                Text(
                  Name,
                  style: GoogleFonts.poppins(
                      fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  Description,
                  style: GoogleFonts.poppins(
                      fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
            ],
        ),
      ),
    );
  }

  Widget ConfirmarButton(){
    return MaterialButton(onPressed: (){}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        color: Color(0xFF3F468F) , child: Text(
      "Confirmar",
      style: GoogleFonts.poppins(
          fontSize: 17,color: Colors.white),
    ),
    );
  }
  
  
}

