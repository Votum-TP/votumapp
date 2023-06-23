import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/model/Election.dart';
import 'package:votum/pages/elections_page/Election_detail_page.dart';
import 'package:votum/widgets/Custom_drawer.dart';

import '../../model/Eleccion.dart';
import '../../providers/Elections_Provider.dart';

class VotePage extends StatefulWidget {
  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  ElectionProvideer voteProvider = new ElectionProvideer();
  var elecciones = <Election>[];
  var elecciones2 = <Election>[];

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      //here is the async code, you can execute any async code here
      var res = await voteProvider.getResults();
      for (var aux in res) {
        elecciones2.add((aux as Election));
      }
      setState(() {
        elecciones = elecciones2;
        print(elecciones.length);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // textinfos3R (174:7750)
                margin: EdgeInsets.fromLTRB(
                    20 * fem, 19 * fem, 19.89 * fem, 29.11 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // participeenestaseleccionesxaf (174:7751)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 205 * fem,
                      ),
                      child: Text(
                        'Participe en estas \nelecciones',
                        style: GoogleFonts.poppins(
                          fontSize: 22 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // seencuentrainscritoenlossiguie (174:7752)
                      constraints: BoxConstraints(
                        maxWidth: 268 * fem,
                      ),
                      child: Text(
                        'Se encuentra inscrito en los siguientes\nprocesos:',
                        style: GoogleFonts.poppins(
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: Color(0xff95989e),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: voteProvider.getResults(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              itemCount: elecciones.length,
                              itemBuilder: (BuildContext context, int index) {
                                Election eleccion = elecciones[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ElectionDetail(
                                                  eleccion: eleccion,
                                                )));
                                  },
                                  child: Container(
                                    height: 81 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff9f9f9),
                                      borderRadius: BorderRadius.circular(
                                          4.7242808342 * fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(
                                              0 * fem, 1.8897122145 * fem),
                                          blurRadius: 0.9448561072 * fem,
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.all(10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // frame187P1 (174:7755)
                                          margin: EdgeInsets.fromLTRB(14 * fem,
                                              0 * fem, 70 * fem, 0 * fem),
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // onlinevoting1CfM (174:7757)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    19 * fem,
                                                    0 * fem),
                                                width: 40.72 * fem,
                                                height: 40.72 * fem,
                                                child: Image.network(
                                                  'https://i.imgur.com/YeElr0Y.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                // descriptionenF (174:7758)
                                                height: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // departamentoacadmicoAu1 (174:7759)
                                                      margin:
                                                      EdgeInsets.fromLTRB(
                                                          0 * fem,
                                                          10 * fem,
                                                          0 * fem,
                                                          4.72 * fem),
                                                      child: Text(
                                                        eleccion.nombre
                                                            .toString(),
                                                        style:
                                                        GoogleFonts.poppins(
                                                          fontSize: 11 * ffem,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          height:
                                                          1.5 * ffem / fem,
                                                          color:
                                                          Color(0xff000000),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      // fechadeinicio10102022QHZ (174:7760)
                                                      margin:
                                                      EdgeInsets.fromLTRB(
                                                          0 * fem,
                                                          0 * fem,
                                                          0 * fem,
                                                          4.72 * fem),
                                                      child: Text(
                                                        'Fecha de inicio:' +
                                                            eleccion.fechaInicio
                                                                .toString(),
                                                        style:
                                                        GoogleFonts.poppins(
                                                          fontSize: 9 * ffem,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          height:
                                                          1.5 * ffem / fem,
                                                          color:
                                                          Color(0xff95989e),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      // estadofinalizadoexb (174:7761)
                                                      'Estado: '+ eleccion.estado.toString(),
                                                      style:
                                                      GoogleFonts.poppins(
                                                        fontSize: 9 * ffem,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        height:
                                                        1.5 * ffem / fem,
                                                        color:
                                                        Color(0xff7fc008),
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
                              });
                        }
                      }))
            ],
          ),
        ));
  }

  buildTextTitleVariation1(String text) {
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

  buildTextTitleVariation2(String text, bool opacity) {
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

  buildTextSubTitleVariation1(String text) {
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

  buildTextSubTitleVariation2(String text) {
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