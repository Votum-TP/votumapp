import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomDrawerState();

}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement drawer
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Colors.blue],
          )
      ),
      child: Drawer(
        child: Container(
            color: Colors.indigo[100],
            child: ListView(padding: EdgeInsets.all(0.0), children: [

              Text('William es Wapo'),
              ListTile(
                title: Text('Elecciones'),
                subtitle: Text('Ir a elecciones'),
              )
            ],)
        ),
      ),
    );
  }
}