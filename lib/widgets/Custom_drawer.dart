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
              color:Colors.white,
              child: ListView(padding: EdgeInsets.all(0.0), children: [

                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color:  Color(0xFF0B9BF5),), accountName: null, accountEmail: null,
                ),

                SizedBox(height: 20,),
                ListTile(
                  title: Text('Elecciones'),
                  subtitle: Text('Ir a elecciones'),
                  leading: _leadingIcon(Icons.home),
                ),
                SizedBox(height: 20,),
                ListTile(
                  title: Text('Info'),
                  subtitle: Text('Sobre Votum'),
                  leading: _leadingIcon(Icons.info),
                  onTap: () {
                    showAboutDialog(
                        context: context,
                        applicationVersion: '^1.0.0',
                        applicationIcon: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/icons/icon.png'),
                        ),
                        applicationName: 'ElectChain',
                        applicationLegalese: 'Brave Tech Solutions');
                  },
                ),
                SizedBox(height: 20,),
                ListTile(
                  title: Text('Cerrar Sesión'),
                  subtitle: Text('Cerrar Sesión'),
                  leading: _leadingIcon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Spacer(),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child:
                  Column(children: [
                    Image(
                      // color: Color,
                      height: 50.0,
                      image: AssetImage('Assets/images/votum.png'),
                      filterQuality: FilterQuality.high,
                    ),
                    SizedBox(height: 20,),

                  ],)

                )
              ],)
          ),
        ),
      );
  }
  Widget _leadingIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}