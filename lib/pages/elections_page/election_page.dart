import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/widgets/Custom_drawer.dart';

class ElectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _ElectionPageState();

}

class _ElectionPageState extends State<ElectionPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Elecciones",
              style: GoogleFonts.poppins(
                  fontSize: 19.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 30.0,
            ),
          ),

        ],
      ),
      drawer: CustomDrawer(),
    );
  }

}