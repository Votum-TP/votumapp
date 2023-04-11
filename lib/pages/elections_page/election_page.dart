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
          SliverList(delegate: SliverChildListDelegate([
            Padding(padding: const EdgeInsets.only(
          left: 20.0, right: 20.0),
            child: Column(
              children: [
                Container(height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey
                  ),
                  margin: const EdgeInsets.all(10.0), child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('dadas'),

                    ),

                    trailing: Icon(Icons.chevron_right) ,
                    title: Text('Departamento académico'),
                    subtitle: Text('Fecha de inicio: 10 / 10 / 2022'),
                  ),),
                Container(height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey
                  ),
                  margin: const EdgeInsets.all(10.0), child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('dadas'),

                    ),

                    trailing: Icon(Icons.chevron_right) ,
                    title: Text('Departamento académico'),
                    subtitle: Text('Fecha de inicio: 10 / 10 / 2022'),
                  ),),
                Container(height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey
                  ),
                  margin: const EdgeInsets.all(10.0), child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('dadas'),

                    ),

                    trailing: Icon(Icons.chevron_right) ,
                    title: Text('Departamento académico'),
                    subtitle: Text('Fecha de inicio: 10 / 10 / 2022'),
                  ),),

              ],
            ),)
          ]))

        ],
      ),
      drawer: CustomDrawer(),
    );
  }

}