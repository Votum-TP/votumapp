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
        child: Drawer(
          child: Container(
              color: Colors.indigo[100],
              child: ListView(padding: EdgeInsets.all(0.0), children: [

                UserAccountsDrawerHeader(accountName: Text('William'), accountEmail: Text('accountEmail'), currentAccountPicture: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage('https://i.imgur.com/0CJ0sT7.png'),

                ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.indigo, Colors.blue])),
                ),

                ListTile(
                  title: Text('Elecciones'),
                  subtitle: Text('Ir a elecciones'),
                  leading: Icon(Icons.home),

                )

              ],)
          ),
        ),
      );
  }
}